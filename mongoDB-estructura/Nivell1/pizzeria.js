use('pizzeria');

db.dropDatabase()

db.clientes.drop();

db.clientes.insertMany([
  { 
    '_id': 1, 
    'nombre': 'Elías', 
    'apellido': 'Huerta', 
    'direccion': 'C/ Llacuna, 2', 
    'codigo_postal': '08011',
    'localidad': {
      'nombre': 'Barcelona',
      'provincia': 'Barcelona'
    },
    'telefono': '902111333',
    "comandas":[
      {
        'id': 1,
        'idtienda': 1,
        'fecha_hora': new Date("2021-11-20T12:05:45"),
        'reparto_recoger': {
            'tipo': 'Recoger en tienda'
        },
        'productos': [
          {
            'cantidad_productos': {
              'pizzas': 2,
              'hamburguesas': 1,
              'bebidas': 2
            },
            'precio_total': 37.75,
            'pizzas': [
              {
                'nombre': 'Nombre pizza 1',
                'descripcion': 'Descripcion pizza 1',
                'imagen': 'Imagen pizza 1',
                'precio': 10.95,
                'categoria': 'Vegetarianas'
              },
              {
                'nombre': 'Nombre pizza 2',
                'descripcion': 'Descripcion pizza 2',
                'imagen': 'Imagen pizza 2',
                'precio': 12.95,
                'categoria': 'Masa fina'
              },
          ],
          'hamburguesas': {
            'nombre': 'Nombre hamburguesa 1',
              'descripcion': 'Descripcion hamburguesa 1',
              'imagen': 'Imagen hamburguesa 1',
              'precio': 8.95,
          },
          'bebidas': [
            {
              'nombre': 'Nombre bebida 1',
              'descripcion': 'Descripcion bebida 1',
              'imagen': 'Imagen Bebida 1',
              'precio': 2.95,
            },
            {
              'nombre': 'Nombre bebida 2',
              'descripcion': 'Descripcion bebida 2',
              'imagen': 'Imagen Bebida 2',
              'precio': 1.95,
            },
          ]
        },
        ] 
      },
      {
        'id': 2,
        'idtienda': 2,
        'fecha_hora': new Date("2022-01-20T12:05:45"),
        'reparto_recoger': {
            'tipo': 'Reparto',
            'idrepartidor': 2,
            'fecha_hora_entrega': new Date("2022-01-20T13:15:25"),
        },
        'productos': [
          {
            'cantidad_productos': {
              'pizzas': 2,
              'hamburguesas': 2,
              'bebidas': 1
            },
            'precio_total': 43.75,
            'pizzas': [
              {
                'nombre': 'Nombre pizza 2',
                'descripcion': 'Descripcion pizza 2',
                'imagen': 'Imagen pizza 2',
                'precio': 12.95,
                'categoria': 'Masa fina'
              },
              {
                'nombre': 'Nombre pizza 3',
                'descripcion': 'Descripcion pizza 3',
                'imagen': 'Imagen pizza 3',
                'precio': 9.95,
                'categoria': 'Sin queso'
              },
          ],
            'hamburguesas': [
            {
              'nombre': 'Nombre hamburguesa 2',
              'descripcion': 'Descripcion hamburguesa 2',
              'imagen': 'Imagen hamburguesa 2',
              'precio': 8.95,
            },
            {
              'nombre': 'Nombre hamburguesa 3',
              'descripcion': 'Descripcion hamburguesa 3',
              'imagen': 'Imagen hamburguesa 3',
              'precio': 9.95,
            },
          ],
            'bebidas': {
              'nombre': 'Nombre bebida 2',
              'descripcion': 'Descripcion bebida 2',
              'imagen': 'Imagen Bebida 2',
              'precio': 1.95,
            },
          },
        ] 
      },
    ],
  },
  { 
    '_id': 2, 
    'nombre': 'Pepe', 
    'apellido': 'Garcia', 
    'direccion': 'C/ Calle, 112', 
    'codigo_postal': '08055',
      'localidad': {
      'nombre': 'Begur',
      'provincia': 'Girona'
      },
    'telefono': '922555666',
    'comandas':
    {
      'id': 3,
      'idtienda': 3,
      'fecha_hora': new Date("2022-03-26T20:05:45"),
      'reparto_recoger': {
          'tipo': 'Recoger en tienda'
      },
      'productos': [
        {
          'cantidad_productos': {
            'pizzas': 1,
            'hamburguesas': 1,
            'bebidas': 1
          },
          'precio_total': 24.75,
          'pizzas':
            {
              'nombre': 'Nombre pizza 1',
              'descripcion': 'Descripcion pizza 1',
              'imagen': 'Imagen pizza 1',
              'precio': 10.95,
              'categoria': 'Vegetarianas'
            },
          'hamburguesas': {
            'nombre': 'Nombre hamburguesa 2',
              'descripcion': 'Descripcion hamburguesa 2',
              'imagen': 'Imagen hamburguesa 2',
              'precio': 8.95,
          },
          'bebidas': 
            {
              'nombre': 'Nombre bebida 1',
              'descripcion': 'Descripcion bebida 1',
              'imagen': 'Imagen Bebida 1',
              'precio': 2.95,
            },
        },
      ] 
    },
  },
  { 
    '_id': 3, 
    'nombre': 'Andrés', 
    'apellido': 'Santana', 
    'direccion': 'C/ Sant Adria, 88', 
    'codigo_postal': '08066' ,
    'localidad': {
      'nombre': 'Mataro',
      'provincia': 'Barcelona'
    },
    'telefono': '94777333',
    'comandas':
    {
      'id': 4,
      'idtienda': 3,
      'fecha_hora': new Date("2022-05-06T21:05:45"),
      'reparto_recoger': {
            'tipo': 'Reparto',
            'idrepartidor': 7,
            'fecha_hora_entrega': new Date("2022-05-06T22:15:25"),
      },
      'productos': [
        {
          'cantidad_productos': {
            'pizzas': 1,
            'hamburguesas': 1,
            'bebidas': 1
          },
          'precio_total': 44.75,
          'pizzas':
            {
              'nombre': 'Nombre pizza 2',
              'descripcion': 'Descripcion pizza 2',
              'imagen': 'Imagen pizza 1',
              'precio': 11.95,
              'categoria': 'Vegetarianas'
            },
          'hamburguesas': {
            'nombre': 'Nombre hamburguesa 1',
              'descripcion': 'Descripcion hamburguesa 1',
              'imagen': 'Imagen hamburguesa 1',
              'precio': 9.95,
          },
          'bebidas': 
            {
              'nombre': 'Nombre bebida 1',
              'descripcion': 'Descripcion bebida 1',
              'imagen': 'Imagen Bebida 1',
              'precio': 2.95,
            },
        },
      ] 
    },
  },
]);

db.tiendas.drop();

db.tiendas.insertMany([
  { 
    '_id': 1, 
    'direccion': 'C/ Mallorca, 2', 
    'codigo_postal': '08999', 
    'localidad': {
      'nombre': 'Badalona',
      'provincia': 'Barcelona'
      },
    'empleados': [
      {
        '_id': 1, 
        'nombre': 'Antonio',
        'Apellidos': 'Gonzalez Gonzalez',
        'codigo_postal': '08999', 
        'nif': '22333111K', 
        'telefono': '933445566', 
        'puesto': 'cocinero'
      },
      {
        '_id': 2, 
        'nombre': 'Ramona',
        'Apellidos': 'Flowers Flowers',
        'codigo_postal': '08666', 
        'nif': '11222111H', 
        'telefono': '911445522', 
        'puesto': 'repartidora'
      }
    ],
    
  },
  { 
    '_id': 2, 
    'direccion': 'C/ Feliz, 222', 
    'codigo_postal': '08000', 
    'localidad': {
      'nombre': 'Gava',
      'provincia': 'Barcelona'
    },
    'empleados': [
      {
        '_id': 3, 
        'nombre': 'Dolores',
        'Apellidos': 'Santana Smith',
        'codigo_postal': '08222', 
        'nif': '11333222I', 
        'telefono': '625445566', 
        'puesto': 'cocinera'
      },
      {
        '_id': 4, 
        'nombre': 'Pepe',
        'Apellidos': 'James',
        'codigo_postal': '08111', 
        'nif': '11000689A', 
        'telefono': '66341122', 
        'puesto': 'repartidor'
      },
      {
        '_id': 5, 
        'nombre': 'Chechu',
        'Apellidos': 'Rodriguez',
        'codigo_postal': '08030', 
        'nif': '45000555B', 
        'telefono': '665251428', 
        'puesto': 'repartidor'
      },
    ],
  },
  { 
    '_id': 3, 
    'direccion': 'C/ Gol, 192', 
    'codigo_postal': '08777', 
    'localidad': {
      'nombre': 'Girona',
      'provincia': 'Girona'
    },
    'empleados': [
      {
        '_id': 6, 
        'nombre': 'María',
        'Apellidos': 'Dominguez Perez',
        'codigo_postal': '08123', 
        'nif': '123456789J', 
        'telefono': '666000222', 
        'puesto': 'repartidora'
      },
      {
        '_id': 7, 
        'nombre': 'Jose',
        'Apellidos': 'Santana Jones',
        'codigo_postal': '08000', 
        'nif': '22000689C', 
        'telefono': '625361425', 
        'puesto': 'repartidor'
      },
      {
        '_id': 8, 
        'nombre': 'Alfonsa',
        'Apellidos': 'Garcia Garcia',
        'codigo_postal': '08031', 
        'nif': '66000555F', 
        'telefono': '665251428', 
        'puesto': 'cocinera'
      },
    ],
  },
]);