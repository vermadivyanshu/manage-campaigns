import moment from 'moment'

campaigns = [
  {
    "id": 1
    "name": "Real Racing",
    "region": "US",
    "createdOn": moment().add('20', 'days').toISOString(),
    "price": {
      "1m": 100,
      "6m": 500,
      "1y": 900
    },
    "csv": "http://www.google.com",
    "report": "http://www.google.com",
    "img": "real-racing.png",
  },
  {
    "id": 2
    "name": "PUBG Mobile",
    "region": "US",
    "createdOn": moment().add('18', 'days').toISOString(),
    "price": {
      "1m": 100,
      "6m": 500,
      "1y": 900
    },
    "csv": "http://www.google.com",
    "report": "http://www.google.com",
    "img": "pubg.png",
  },
  {
    "id": 3
    "name": "Flow Free",
    "region": "US",
    "createdOn": moment().add('14', 'days').toISOString(),
    "price": {
      "1m": 100,
      "6m": 500,
      "1y": 900
    },
    "csv": "http://www.google.com",
    "report": "http://www.google.com",
    "img": "free-flow.png",
  },
  {
    "id": 4
    "name": "Mortal Combat",
    "region": "US",
    "createdOn": moment().add('12', 'days').toISOString(),
    "price": {
      "1m": 100,
      "6m": 500,
      "1y": 900
    },
    "csv": "http://www.google.com",
    "report": "http://www.google.com",
    "img": "mortal-combat.png",
  },
  {
    "id": 5
    "name": "Summoners War",
    "region": "US",
    "createdOn": moment().add('10', 'days').toISOString(),
    "price": {
      "1m": 100,
      "6m": 500,
      "1y": 900
    },
    "csv": "http://www.google.com",
    "report": "http://www.google.com",
    "img": "summoners-war.png",
  },
  {
    "id": 6
    "name": "Need For Speed No Limits",
    "region": "US",
    "createdOn": moment().toISOString(),
    "price": {
      "1m": 100,
      "6m": 500,
      "1y": 900
    },
    "csv": "http://www.google.com",
    "report": "http://www.google.com",
    "img": "nfs.png",
  },
  {
    "id": 7
    "name": "Shadow Fight 3",
    "region": "US",
    "createdOn": moment().toISOString(),
    "price": {
      "1m": 100,
      "6m": 500,
      "1y": 900
    },
    "csv": "http://www.google.com",
    "report": "http://www.google.com",
    "img": "shadow-fight.png",
  },
  {
    "id": 9
    "name": "Mortal Combat",
    "region": "US",
    "createdOn": moment().subtract('12', 'days').toISOString(),
    "price": {
      "1m": 100,
      "6m": 500,
      "1y": 900
    },
    "csv": "http://www.google.com",
    "report": "http://www.google.com",
    "img": "mortal-combat.png",
  },
  {
    "id": 10
    "name": "Flow Free",
    "region": "US",
    "createdOn": moment().subtract('14', 'days').toISOString(),
    "price": {
      "1m": 100,
      "6m": 500,
      "1y": 900
    },
    "csv": "http://www.google.com",
    "report": "http://www.google.com",
    "img": "free-flow.png",
  },
  {
    "id": 11
    "name": "Need For Speed No Limits",
    "region": "US",
    "createdOn": moment().subtract('16', 'days').toISOString(),
    "price": {
      "1m": 100,
      "6m": 500,
      "1y": 900
    },
    "csv": "http://www.google.com",
    "report": "http://www.google.com",
    "img": "nfs.png",
  }
]

export default campaigns
