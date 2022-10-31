require 'rails_helper'

RSpec.describe Order do
  subject { Order.new(
    { state: 'created', 
      payment_method: payment_method, 
      buyer_email: 'buyer@example.com',
      items: items },
      tax_calculator: tax_calculator
    )}

  let(:tax_calculator) { class_double('TaxCalculator') }
  let(:payment_method) { double('credit card') }
  let(:items) { [double('item 1', total: 15.0), double('item 2', total: 5.0)] }

  describe '#checkout' do

    before do
      expect(tax_calculator).to receive(:calculate).with(subject) { 10.0 }.ordered
    end


    it 'calls out to the payment gateway with the items totals and tax' do
      expect(PaymentGateway).to receive(:process_payment).with(30.0, payment_method) { :success }.ordered

      subject.checkout
    end

    context 'when the payment processes successfully' do

      before do
        expect(PaymentGateway).to receive(:process_payment) { :success }
      end

      it 'sets the state to completed' do
        subject.checkout
        expect(subject.state).to eql(:completed)
      end


      it 'emails the buyer' do
        expect(Mailer).to receive(:send_mail).with(:order_success, 'buyer@example.com')
        subject.checkout
      end
    end

    context 'when the payment processes unsuccessfully' do

      before do
        expect(PaymentGateway).to receive(:process_payment) { :failure }
      end

      it 'sets the state to failed' do
        subject.checkout
        expect(subject.state).to eql(:payment_failed)
      end

      it 'does not send the order success email' do
        expect(Mailer).to_not receive(:send_mail)
        subject.checkout
      end
    end


  end
end