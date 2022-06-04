use('yotubeehz');

db.dropDatabase()

db.usuarios.drop();

db.usuarios.insertMany([
    { 
        '_id': 1, 
        'email': 'usuario1@gmail.com', 
        'password': 'aei123', 
        'nombre_usuario': 'usuario1', 
        'fecha_nacimiento': '1990-01-01',
        'sexo': 'hombre',
        'pais': 'Lituania',
        'codigo_postal': '00111',
        'suscripciones': [2, 3],
        'canal': {
            '_id': 1,
            'nombre': 'Canal 1 Usuario 1',
            'descripcion': 'Decripcion del canal 1',
            'fecha_creacion': '2020-01-01',
        },
        'playlist':{
            '_id': 1,
            'nombre': 'Playlist 1',
            'fecha_creacion': '2020-01-02',
            'estado': 'público',
            'videos': 1,
        },
    }, 
    { 
        '_id': 2, 
        'email': 'usuario2@gmail.com', 
        'password': 'aei222', 
        'nombre_usuario': 'usuario2', 
        'fecha_nacimiento': '1992-02-02',
        'sexo': 'mujer',
        'pais': 'Estonia',
        'codigo_postal': '00222',
        'suscripciones': 1,
        'canal': {
            '_id': 2,
            'nombre': 'Canal 2 Usuario 2',
            'descripcion': 'Decripcion del canal 2',
            'fecha_creacion': '2022-02-02',
        },
        'playlist':{
            '_id': 2,
            'nombre': 'Playlist 2',
            'fecha_creacion': '2022-02-02',
            'estado': 'público',
            'videos': [2, 3]
        },
    },
        { 
        '_id': 3, 
        'email': 'usuario3@gmail.com', 
        'password': 'aei333', 
        'nombre_usuario': 'usuario3', 
        'fecha_nacimiento': '1993-03-03',
        'sexo': 'mujer',
        'pais': 'Estonia',
        'codigo_postal': '00333',
        'suscripciones': [1, 2],
        'canal': {
            '_id': 3,
            'nombre': 'Canal 3 Usuario 3',
            'descripcion': 'Decripcion del canal 3',
            'fecha_creacion': '2022-03-03',
        },
        'playlist':{
            '_id': 3,
            'nombre': 'Playlist 3',
            'fecha_creacion': '2022-02-02',
            'estado': 'público',
            'videos': 2,
        },
    },
]);

db.videos.drop();

db.videos.insertMany([
    {
        '_id': 1,
        'titulo': 'Titulo video 1',
        'decripcion': 'Decripcion video 1',
        'tamaño': '1gb',
        'nombre_archivo': 'Nombre video 1',
        'duracion': "1'20",
        'thumbnail': "thumbnailvideo1",
        'numero_reproducciones': 111,
        'likes': 11,
        'dislikes': 1,
        'estado': 'público',
        'etiquetas': {
            '_id': 1,
            'nombre': '#video1',
        },
        'usuario': 1,
        'fecha_publicaicon': '2020-01-01',
        'likes': [{
            'usuario': 1,
            'fecha': '2020-01-02 12:22:22',
            'like_dislike': 'like',
        },
                {
            'usuario': 2,
            'fecha': '2020-02-02 13:33:33',
            'like_dislike': 'dislike',
        }],

        'comentarios':{
            '_id': 1,
            'texto': 'Texto comentario 1',
            'fecha_hora': '2020-01-02 13:33:33',
            'like_dislike': {
                'like_dislike': 'like',
                'usuario': 2,
                'fecha_hora': '2022-02-02 22:22:22',
            },
        },
    },
    {
        '_id': 2,
        'titulo': 'Titulo video 2',
        'decripcion': 'Decripcion video 2',
        'tamaño': '2gb',
        'nombre_archivo': 'Nombre video 2',
        'duracion': "2'20",
        'thumbnail': "thumbnailvideo2",
        'numero_reproducciones': 222,
        'likes': 11,
        'dislikes': 2,
        'estado': 'privado',
        'etiquetas': {
            '_id': 2,
            'nombre': '#video2',
        },
        'usuario': 1,
        'fecha_publicaicon': '2022-02-02',
        'likes': [{
            'usuario': 2,
            'fecha': '2022-02-02 14:22:22',
            'like_dislike': 'like',
        },
        {
            'usuario': 1,
            'fecha': '2022-02-02 13:32:33',
            'like_dislike': 'dislike',
        }],

        'comentarios':{
            '_id': 2,
            'texto': 'Texto comentario 2',
            'fecha_hora': '2022-01-02 14:33:33',
            'like_dislike': {
                'like_dislike': 'like',
                'usuario': 3,
                'fecha_hora': '2022-04-02 23:22:22',
            },
        },
    },
    {
        '_id': 3,
        'titulo': 'Titulo video 3',
        'decripcion': 'Decripcion video 3',
        'tamaño': '3gb',
        'nombre_archivo': 'Nombre video 3',
        'duracion': "3'20",
        'thumbnail': "thumbnailvideo3",
        'numero_reproducciones': 333,
        'likes': 33,
        'dislikes': 3,
        'estado': 'oculto',
        'etiquetas': {
            '_id': 3,
            'nombre': '#video3',
        },
        'usuario': 3,
        'fecha_publicaicon': '2022-01-01',
        'likes': [{
            'usuario':3,
            'fecha': '2023-01-02 12:22:22',
            'like_dislike': 'like',
        }],
        'comentarios':{
            '_id': 3,
            'texto': 'Texto comentario3',
            'fecha_hora': '2022-03-03 13:33:33',
            'like_dislike': {
                'like_dislike': 'like',
                'usuario': 3,
                'fecha_hora': '2022-02-02 22:22:22',
            },
        },
    },
]);
