# Racing Cars

```
rake db:migrate
```

```
rake db:seed
```

### Url to get result
http://localhost:3000/api/v1/cars/ford_shelby?track=nurburgring


### Data in database

Cars:
```
"Subaru Impreza" => 280, "Ford Shelby" => 250, "Dodge Challenger" => 310
```

Tracks:
```
country: "Germany", name: "nurburgring", timezone: "CET", surface_type: "asphalt"
country: "Australia", name: "sydney_motorsport_park", timezone: "Australia/Sydney", surface_type: "gravel"
country: "Canada", name: "circuit_gilles_villenaeuve_montreal", timezone: "America/Montreal", surface_type: "snow"
country: "Macau", name: "guia_circut", timezone: "Asia/Macau", surface_type: "asphalt"
```
