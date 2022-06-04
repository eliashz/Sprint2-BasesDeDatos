use('opticaehz');

db.proveedor.drop();

db.proveedor.insertMany([
   {
    "_id": 1,
    "nombre": "Gafotas S.L.",
    "direccion":{
        "calle": "Mallorca",
        "numero": "137",
        "piso": "2",
        "puerta": "4",
        "ciudad": "Barcelona",
        "codigo_postal": "08030",
        "pais": "España"
        },
    "telefono": "933000111",
    "fax": "933111000",
    "nif": "45677766K"
    },
    {   
    "_id": 2,
    "nombre": "Ulleres S.L.",
    "direccion":{
        "calle": "Valencia",
        "numero": "371",
        "piso": "6",
        "puerta": "6",
        "ciudad": "Barcelona",
        "codigo_postal": "08031",
        "pais": "España"
        },
    "telefono": "933111222",
    "fax": "933111666",
    "nif": "12377766K"
    },
    {   
    "_id": 3,
    "nombre": "Sunglasses S.L.",
    "direccion":{
        "calle": "Gran Via",
        "numero": "667",
        "piso": "12",
        "puerta": "2",
        "ciudad": "Barcelona",
        "codigo_postal": "08036",
        "pais": "España"
        },
    "telefono": "933666111",
    "fax": "933555333",
    "nif": "55177766F"
    }
]);

db.clientes.drop();

db.clientes.insertMany([
    {
        "_id": 1,
        "nombre": "Elías Huerta",
        "gafas": [{
            "_id": 1,
            "idproveedor": {proveedor_id: 1},
            "marca": "Ray Ban",
            "graducacion_izq": 5.2,
            "graduacion_der": 3.4,
            "montura": "flotante",
            "color_montura": "negro",
            "color_vidrio": "transparente",
            "precio": 99.95,
            "fecha_venta": "2022-04-28",
            "empleado_venta": "María"
        }, 
        {
            "_id": 4,
            "idproveedor": 3,
            "marca": "Tom Ford",
            "graducacion_izq": 5,
            "graduacion_der": 3,
            "montura": "metalica",
            "color_montura": "amarillo",
            "color_vidrio": "transparente",
            "precio": 130.95,
            "fecha_venta": "2022-02-06",
            "empleado_venta": "Joe"
        }],
        "direccion": "Carrer de Lliuva, 12",
        "telefono": "928782211",
        "correo_electronico": "elias@gmail.com",
        "fecha_registro": "2021-11-23"
    }, 
    {
        "_id": 2,
        "nombre": "Max Dembo",
        "gafas": {
            "_id": 2,
            "idproveedor": 1,
            "marca": "Ray Ban",
            "graducacion_izq": 1.2,
            "graduacion_der": 1.4,
            "montura":  "pasta",
            "color_montura": "rojo",
            "color_vidrio": "negro",
            "precio": 75.95,
            "fecha_venta": "2022-03-20",
            "empleado_venta": "María"
        },
        "direccion": "Carrer de Mallorca, 112",
        "telefono": "600111000",
        "correo_electronico": "mdembo@gmail.com",
        "fecha_registro": "2022-01-23",
        "recomendacion": 1
    }, 
    {
        "_id": 3,
        "nombre": "Daniel Johns",
        "gafas": {
            "_id": 3,
            "idproveedor": 2,
            "marca": "Hawkers",
            "graducacion_izq": 0,
            "graduacion_der": 0,
            "montura": "metalica",
            "color_montura": "azul",
            "color_vidrio": "negro",
            "precio": 35.95,
            "fecha_venta": "2022-01-05",
            "empleado_venta": "Joe"
        },
        "direccion": "Carrer de Sidney, 1",
        "telefono": "666000111",
        "correo_electronico": "johnsy@gmail.com",
        "fecha_registro": "2022-04-13",
        "recomendacion": 2,
    }, 
    {
        "_id": 4,
        "nombre": "Layne Santana",
        "direccion": "Carrer de Seattle, 121",
        "telefono": "666525521",
        "correo_electronico": "aic@gmail.com",
        "fecha_registro": "2022-02-01",
        "recomendacion": 1,
    }
]);