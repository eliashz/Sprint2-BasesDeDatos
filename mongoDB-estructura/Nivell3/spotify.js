
use('spotifyehz');

db.usuarios.drop();

db.usuarios.insertMany([
  { 
      '_id': 1, 
      'email': 'usuario1@gmail.com', 
      'passwoord': '12345', 
      'nombre_usuario': 'usuario1', 
      'fecha_nacimiento': new Date('2001-01-01T01:00:00Z'),
      'sexo': 'mujer',
      'pais': 'Nueva Zelanda',
      'codigo_postal': '01111',
      'tipo_usuario': 'FREE',
      'playlists': [{
          'titulo': 'playlist1',
          'numero_canciones': 11,
          'tipo': 'borrada',
          'fecha_borrado': new Date('2002-02-02T02:00:00Z')
      },
      {
          'titulo': 'Playlist2',
          'numero_canciones': '22',
          'tipo': 'activa',
          'activa': [{
              'idusuario': 1,
              'idcancion': 1,
              'fecha': new Date('2003-03-03T03:00:00Z')
          },
          {
              'idusuario': 1,
              'idcancion': 2,
              'fecha': new Date('2003-04-04T03:00:00Z')
          },
          {
              'idusuario': 2,
              'idcancion': 3,
              'fecha': new Date('2003-05-03T03:00:00Z')
          }],
      }],
      'siguiendo': {
          'idgrupo': 1
      },
      'favoritos': [{
          'idalbums': 1,
      },
      {
        'idalbums': 2,
      },
      {
          'idcanciones': 1,
      }],
},
{ 
      '_id': 2, 
      'email': 'usuario2@gmail.com', 
      'passwoord': '23456', 
      'nombre_usuario': 'usuario2', 
      'fecha_nacimiento': new Date('2002-02-02T02:22:00Z'),
      'sexo': 'hombre',
      'pais': 'Australia',
      'codigo_postal': '02222',
      'tipo_usuario': 'FREE',
      'playlists': [{
          'titulo': 'playlist3',
          'numero_canciones': 33,
          'tipo': 'borrada',
          'fecha_borrado': new Date('2003-03-03T03:00:00Z')
      },
      {
          'titulo': 'Playlist4',
          'numero_canciones': '44',
          'tipo': 'activa',
          'activa': [{
              'idusuario': 1,
              'idcancion': 2,
              'fecha': new Date('2004-03-03T03:00:00Z')
          },
          {
              'idusuario': 3,
              'idcancion': 1,
              'fecha': new Date('2004-04-04T03:00:00Z')
          }],
      }],
      'siguiendo': [{
          'idgrupo': 1
      },
      {
          'idgrupo': 2
      }
      ],
      'favoritos': [{
          'idalbums': 2,
      },
      {
        'idcanciones': 1,
      },
      {
          'idcanciones': 3,
      }],
},
{ 
      '_id': 3, 
      'email': 'usuario3@gmail.com', 
      'passwoord': '33333', 
      'nombre_usuario': 'usuario3', 
      'fecha_nacimiento': new Date('2003-03-01T03:00:00Z'),
      'sexo': 'mujer',
      'pais': 'Togo',
      'codigo_postal': '03333',
      'tipo_usuario': 'PREMIUM',
      'suscripcion': {
          'fecha_inicio': new Date('2000-01-01T03:00:00Z'),
          'fecha_renovacion': new Date('2001-01-01T03:00:00Z'),
          'pago': {
              'tarjeta':{
                  'numero_tarjeta': '1111 2222 3333 4444',
                  'mes_anyo': '11/22',
                  'codigo': '111'
              },
              'registro_pagos': [{
                  'idpago': 1,
                  'fecha_pago': new Date('2000-01-01T03:00:00Z'),
                  'total': 12.95  
              },
              { 
                 'idpago': 2,
                 'fecha_pago': new Date('2001-01-01T03:00:00Z'),
                 'total': 15.95  
              }]
          }
      },
      'playlists': [{
          'titulo': 'playlist3',
          'numero_canciones': 33,
          'tipo': 'borrada',
          'fecha_borrado': new Date('2004-02-02T02:00:00Z')
      },
      {
          'titulo': 'Playlist5',
          'numero_canciones': '55',
          'tipo': 'activa',
          'activa': [{
              'idusuario': 1,
              'idcancion': 1,
              'fecha': new Date('2003-03-03T03:00:00Z')
          },
          {
              'idusuario': 1,
              'idcancion': 2,
              'fecha': new Date('2003-04-04T03:00:00Z')
          },
          {
              'idusuario': 2,
              'idcancion': 3,
              'fecha': new Date('2003-05-03T03:00:00Z')
          }],
      }],
      'siguiendo': {
          'idgrupo': 1
      },
      'favoritos': [{
          'idalbums': 1,
      },
      {
        'idalbums': 2,
      },
      {
          'idcanciones': 1,
      }],
},
{ 
      '_id': 4, 
      'email': 'usuario4@gmail.com', 
      'passwoord': '44444a', 
      'nombre_usuario': 'usuario4', 
      'fecha_nacimiento': new Date('2004-04-01T03:00:00Z'),
      'sexo': 'mujer',
      'pais': 'Japón',
      'codigo_postal': '04444',
      'tipo_usuario': 'PREMIUM',
      'suscripcion': {
          'fecha_inicio': new Date('2002-02-02T02:00:00Z'),
          'fecha_renovacion': new Date('2002-02-02T02:00:00Z'),
          'pago': {
              'tarjeta':{
                  'numero_tarjeta': '2222 5555 3333 8888',
                  'mes_anyo': '22/13',
                  'codigo': '222'
              },
              'registro_pagos': {
                  'idpago': 1,
                  'fecha_pago': new Date('2000-01-01T03:00:00Z'),
                  'total': 12.95  
              }
          }
      },
      'playlists': [{
          'titulo': 'playlist3',
          'numero_canciones': 31,
          'tipo': 'borrada',
          'fecha_borrado': new Date('2004-02-02T02:00:00Z')
      },
      {
          'titulo': 'Playlist5',
          'numero_canciones': '55',
          'tipo': 'activa',
          'activa': [{
              'idusuario': 3,
              'idcancion': 1,
              'fecha': new Date('2003-03-03T03:00:00Z')
          },
          {
              'idusuario': 2,
              'idcancion': 12,
              'fecha': new Date('2003-04-04T03:00:00Z')
          },
          {
              'idusuario': 3,
              'idcancion': 3,
              'fecha': new Date('2003-05-03T03:00:00Z')
          }],
      }],
      'siguiendo': {
          'idgrupo': 1
      },
      'favoritos': [{
          'idalbums': 3,
      },
      {
        'idalbums': 1,
      },
      {
          'idcanciones': 2,
      }],
}
]);

db.grupos.drop();

db.grupos.insertMany([
    {
        'idgrupo': 1,
        'nombre': 'Tool',
        'foto': 'foto01',
        'estilo': 'Rock',
        'album': [{
            'idalbums': 1,
            'titulo': 'Lateralus',
            'anyo': 2001,
            'portada': 'portada01',
            'canciones': [{
                'idcanciones': 1,
                'titulo': 'Tick & Leeches',
                'duracion': '7:00',
                'reproducciones': 99
            },
            {
                'idcanciones': 2,
                'titulo': 'Schism',
                'duracion': '5:00',
                'reproducciones': 55
            },
             {
                'idcanciones': 3,
                'titulo': 'Patient',
                'duracion': '6:12',
                'reproducciones': 66
            }]
        },
        {
            'idalbums': 2,
            'titulo': 'Aenima',
            'anyo': 1996,
            'portada': 'portada02',
            'canciones': [{
                'idcanciones': 4,
                'titulo': 'Stinkfist',
                'duracion': '5:02',
                'reproducciones': 909
            },
            {
                'idcanciones': 4,
                'titulo': 'Pushit',
                'duracion': '14:00',
                'reproducciones': 155
            },
             {
                'idcanciones': 5,
                'titulo': 'Eulogy',
                'duracion': '3:22',
                'reproducciones': 606
            }]
        }
        ]
    },
        {
        'idgrupo': 2,
        'nombre': 'Silverchair',
        'foto': 'foto02',
        'estilo': 'Rock',
        'album': [{
            'idalbums': 3,
            'titulo': 'Freak Show',
            'anyo': 1997,
            'portada': 'portada03',
            'canciones': [{
                'idcanciones': 6,
                'titulo': 'Freak',
                'duracion': '2:00',
                'reproducciones': 1199
            },
            {
                'idcanciones': 7,
                'titulo': 'Abuse Me',
                'duracion': '4:12',
                'reproducciones': 155
            },
             {
                'idcanciones': 8,
                'titulo': 'The Closing',
                'duracion': '4:53',
                'reproducciones': 12366
            }]
        },
        {
            'idalbums': 4,
            'titulo': 'Frogstomp',
            'anyo': 1994,
            'portada': 'portada04',
            'canciones': [{
                'idcanciones': 9,
                'titulo': 'Stinkfies',
                'duracion': '5:02',
                'reproducciones': 909
            },
            {
                'idcanciones': 10,
                'titulo': 'Slave',
                'duracion': '1:20',
                'reproducciones': 13355
            },
             {
                'idcanciones': 11,
                'titulo': 'Cemetery',
                'duracion': '3:45',
                'reproducciones': 12588
            }]
        }
        ]
    }
]);