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

#### Cars:
Car type. |. Max Speed
----------|-----------
Subaru Impreza | 280km/h
Ford Shelby  | 250km/h
Dodge Challenger | 310km/h


#### Tracks:
Country | Name | Timezone | Surface type
--------|------|----------|-------------
Germany | Nurburgring | CET | Asphalt
Australia | Sydney Motorsport Park | Australia/Sydney | gravel
Canada | Circuit Gilles Villenaeuve Montreal | America/Montreal | Snow
Macau | Guia Circut | Asia/Macau | Asphalt

System expose public interface which accepts GET request with slug of the car and respond with it