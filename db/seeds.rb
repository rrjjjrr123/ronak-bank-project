admin = User.create!(first_name: 'ronak"', last_name: 'admin',
                     email: 'admin@gmail.com',
                     password: 'admin123', user_type: 1)
admin.confirm
