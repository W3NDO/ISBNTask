# ISBNTask
The code here will calculate the check digit of an ISBN13 barcode

1. Take each digit, from left to right and multiply them alternatively by 1 and 3
2. Sum those numbers
3. Take mod 10 of the summed figure
4. Subtract 10 and if the end number is 10, make it 0

Example for 978014300723: we should get 9780143007234

The code will accept 12 digits and calculate a the check digit and append it to the end returning the valid ISBN13 number or it will accept 13 digits and validate whether it is a correct ISBN number. If it is not valid it will return the valid ISBN number.

TO run this code you need any ruby version after 2.7.2.
Run `bundle install` in this directory to install the dependancies
Run `rspec` to run the tests.
