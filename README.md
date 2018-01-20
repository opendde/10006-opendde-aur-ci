## Command line stock and cryptocurrency portfolio tracker.
#### How to install:
```bash
$ git clone https://github.com/aokellermann/tick.git
$ cd tick
$ make
$ sudo make install
```
If you are an Arch user, you can install from the AUR.
```bash
$ yaourt -S tick
```
#### Usage
To update your portfolio, use the options add, rm, or set. You may use the
special string "USD$" to add US Dollars to your portfolio.
```bash
$ tick [add/rm/set] [symbol/crypto_id/USD$] [quantity of shares] [USD spent]
```
For example, to add 3 shares of Tesla bought for $918.12 total, run
```bash
$ tick add tsla 3 918.12
```
The parameter "add" will add your input to the current portfolio, "rm" will
subtract from your current portfolio, and "set" will set your portfolio to
the input, discarding any existing data about that security. Trading costs/fees
should be factored into your USD spent. When adding a cryptocurrency to your
portfolio, you must use the cryptocurrency's name. For instance, to add Ripple,
you must use "ripple" instead of "xrp". This is due to some cryptocurrency
tickers also being listed on the stock market, such as ETH.

To get info about your current holdings, run
```bash
$ tick check [symbol/crypto_id/all]
```
The string "all" will list your entire portfolio, as well as produce a grand
total.

Please be aware that printing information for mutual funds and over-the-counter
securities may take up to 10 seconds each. This is due to Alpha Vantage's
relatively slow API. NYSE and NASDAQ listed stocks and ETFs, as well as cryptocurrencies
should take less than one second to print each.

Once installed, you may read the man page for more information.

#### License
MIT License

Stock information is taken from IEX's free API. Mutual fund and over-the-counter information is taken from Alpha Vantage's
free API. Cryptocurrency information is taken from Coinmarketcap's free API. Please do not abuse the APIs by repeatedly requesting
information. Read the provided license for more information.
#### Future Ideas
* Command to get info about a security
* More robust information in "check"
* Historical support -- 24h/7d profits