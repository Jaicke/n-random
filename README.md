# N Random

## Aplicação
Web service que recupera 600 números randômicos previamente adicionados de 4 bancos de dados diferentes.

[DEMO](https://n-random-api.herokuapp.com/get_numbers)

## Ferramentas utilizadas
- [Docker](https://www.docker.com/)
- [Docker Compose](https://github.com/docker/compose)
- [Heroku](https://www.heroku.com/)
- [Postman](https://www.postman.com/)
- [Sinatra](http://sinatrarb.com/)

## Testando aplicação

### Pré-requisitos
- Docker instalado, veja como instalar [aqui](https://docs.docker.com/).
- Docker compose instalado, veja como instalar [aqui](https://docs.docker.com/compose/install/).

### Preparando aplicação
- ``` docker-compose build ```

### Executando aplicação
- ``` docker-compose up ```

Dessa forma é possivel acessar a aplicação em ```localhost:3000/get_numbers```

### Requisição

#### Parâmetro

##### O parâmetro *db* pode ser um dos valores abaixo:

*mongodb*

*mysql*

*postgresql*

*sqlserver*

#### Exemplos de requisição

![](https://i.imgur.com/ym2nm85.png)

``` localhost:3000/get_numbers?db=mongodb ```

``` localhost:3000/get_numbers?db=mysql ```

``` localhost:3000/get_numbers?db=postgresql ```

``` localhost:3000/get_numbers?db=sqlserver ```




