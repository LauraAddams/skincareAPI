# SkincareAPI

SkincareAPI is a skincare product API. The API was created as part of a capstone project for [Ada Developers Academy](https://www.adadevelopersacademy.org/).  

The idea is to provide users with a catalog of products with brand, name, and ingredients that can be used for test projects.  

## API
#### Base URL
```
GET https://skincare-api.herokuapp.com
```

### Products

#### `GET /products`
Returns a list of all products  

```json
[
    {
        "id": 1,
        "brand": "amorepacific",
        "name": "age spot brightening pen",
        "ingredient_list": [
            "water",
            "butylene glycol",
            "alcohol",
            ...
        ]
    },
    {
        "id": 2,
        "brand": "amorepacific",
        "name": "all day balancing care serum",
        "ingredient_list": [
            "camellia sinensis leaf water",
            "phyllostachis bambusoides juice",
            "panax ginseng root extract",
            ...
        ]
    },
    {
        "id": 3,
        "brand": "amorepacific",
        "name": "bio-enzyme refining complex",
        "ingredient_list": [
            "panax ginseng root extract",
            "cyclopentasiloxane",
            "dimethicone",
            ...
        ]
    },
    ...
]
```

#### `GET /products/1`
Returns a single product by id number

```json
{
    "id": 1,
    "brand": "amorepacific",
    "name": "age spot brightening pen",
    "ingredient_list": [
        "water",
        "butylene glycol",
        "alcohol",
        "dipropylene glycol",
        "peg-75",
        "glycereth-26",
        "ascorbyl glucoside",
        "camellia sinensis leaf extract",
        "panax ginseng root extract",
        "glycyrrhiza glabra (licorice) root extract",
        "magnolia obovata bark extract",
        "equisetum arvense extract",
        "calcium pantetheine sulfonate",
        "betaine",
        "biosaccharide gum-1",
        "carbomer",
        "peg-60 hydrogenated castor oil",
        "sodium citrate",
        "cellulose gum",
        "citric acid",
        "triethanolamine",
        "potassium hydroxide",
        "disodium edta",
        "methylparaben",
        "propylparaben",
        "fragrance"
    ]
}
```

#### `POST /products`
Adds a product, **new** ingredients are added to the ingredient database
- Accepted params(all fields must be present):
- brand (string)
- name (string)
- ingredients (string)
-*string separated by commas*
-ex. "water,alcohol,citric acid,..."  

### Ingredients

#### `GET /ingredients`
Returns a list of all unique ingredients  

```json
[
    {
        "id": 1,
        "ingredient": "water"
    },
    {
        "id": 2,
        "ingredient": "butylene glycol"
    },
    {
        "id": 3,
        "ingredient": "alcohol"
    },
    ...
]
```

### Queries
Products and ingredients can both be queried at their **singular** routes

#### `GET /product?q=rose+water`
Searches brand, name, and ingredients for *LIKE* values    

```json
[
    {
        "id": 564,
        "brand": "lioele",
        "name": "a.c control mousse cleanser trouble hunter",
        "ingredient_list": [
            "water",
            "ammonium lauryl sulfate",
            "cocamidopropyl betaine",
            "peg-8",
            "polysorbate 20",
            "salicylic acid",
            "fragrance",
            "henoxyethanol",
            "potassium hydroxide",
            "methylparaben",
            "sodium methyl cocoyl taurate",
            "sodium citrate",
            "tetrasodium edta",
            "dipotassium glycyrrhizate",
            "tocopheryl acetate",
            "benzophenone-4",
            "rose water",
            "camillia sinensis leaf extract."
        ]
    },
    ...
]
```

#### `GET /ingredient?q=rose+water`
Searches ingredient for *LIKE* values  

```json
[
    {
        "id": 2493,
        "ingredient": "rose water"
    },
    {
        "id": 3103,
        "ingredient": "damask rose water"
    }
]
```

#### Query Pagination
Addition params can be sent for pagination results
