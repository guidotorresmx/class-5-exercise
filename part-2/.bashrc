#todo: create cryptos list and loop over it
#todo: add more info


#hello message containing some cryptos prices 
btc=$(curl -s https://api.coinbase.com/v2/prices/BTC-CAD/buy | cut -d\: -f5 | cut -d\" -f2)
eth=$(curl -s https://api.coinbase.com/v2/prices/ETH-CAD/buy | cut -d\: -f5 | cut -d\" -f2)
ltc=$(curl -s https://api.coinbase.com/v2/prices/LTC-CAD/buy | cut -d\: -f5 | cut -d\" -f2)

if [ -z "$btc" ]
then
    echo "Please check your internet connection so you can get current cryptocurrencies prices."
else
    echo 'Current prices for cryptocurrencies are: '
    echo "    BTC: $ $btc CAD | ETH: $ $eth CAD | LTC: $ $ltc CAD"
    echo "    goto https://www.coinbase.com/price for details"
fi

#getting prices data
getpricing () {
    price=$(curl -s https://api.coinbase.com/v2/prices/$1-CAD/buy | cut -d\: -f5 | cut -d\" -f2) 
    if [ -z "$price" ]
    then
        #issues retrieving info
        echo "Sorry, $1 identifier is not available at the momment, try with BTC, ETH, LTC or similar, or check your internet connection"
    else
        echo "The price for $1 is $ $price CAD"
    fi
}

alias getpricing="gp $1"