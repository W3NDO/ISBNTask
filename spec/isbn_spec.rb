require 'spec_helper'
require_relative '../isbn'


RSpec.describe Isbn do
  context "#calculateCheckDigit" do
    let(:isbn) {Isbn.new}
    it "return the correct check digit" do
      expect(isbn.calculateCheckDigit(isbn: 978014300723)).to eq 4
    end
    it "Doesn't accept 13 digit ISBNs and isntead asks you to use the validate function" do
      expect(isbn.calculateCheckDigit(isbn: 9780143007234)).to eq "Please enter the first 12 digits of the ISBN13 bar code."
    end
    it "fails if notihing is passed" do
      expect(isbn.calculateCheckDigit()).to eq "Please pass an ISBN number."
    end
  end

  context "#validISBN?" do
    let(:isbn) {Isbn.new}
    it "returns true if ISBN is valid" do
      expect(isbn.validISBN?(isbn: 9780143007234)).to be true
    end
    it "returns false if ISBN is invalid" do
      expect(isbn.validISBN?(isbn: 9780143007235)).to be false
    end
    it "Fails if the wrong length of isbn is passed" do
      expect(isbn.validISBN?(isbn: 978014300723)).to eq "Please enter valid ISBN13 barcode"
    end
    it "fails if notihing is passed" do
      expect(isbn.validISBN?()).to eq "Please pass an ISBN number."
    end
  end
end
