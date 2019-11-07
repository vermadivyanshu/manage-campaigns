currencyMultipliers = {
  'en': 1.0
  'de': 0.9
}

module.exports.currencyConvertor = (usdAmount, currencyType) ->
  if currencyMultipliers[currencyType]
    usdAmount * currencyMultipliers[currencyType]
  else
    usdAmount
