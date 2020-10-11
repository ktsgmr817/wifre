User.create(
  email: 'u120837h@ecs.osaka-u.ac.jp', nickname: '大ちゃん', university_id: 1,
  password: 'password', password_confirmation: 'password',
  lastname: '石橋', firstname: '大輝', birth_date: Date.new(2000,1,1),
  sex: 0, grade: 1, faculty: '法学部', department: '法学科'
)

User.create(
    email: 'u234098h@ecs.osaka-u.ac.jp', nickname: 'みさ', university_id: 1,
    password: 'password', password_confirmation: 'password',
    lastname: 'みさ', firstname: 'みさ', birth_date: Date.new(2000,1,1),
    sex: 1, grade: 1, faculty: '法学部', department: '国際教養学科'
)

User.create(
    email: 'u123137h@ecs.osaka-u.ac.jp', nickname: '川村', university_id: 1,
    password: 'password', password_confirmation: 'password',
    lastname: '川村', firstname: '浩輔', birth_date: Date.new(2000,1,1),
    sex: 0, grade: 1, faculty: '文学部', department: '日本史学科'
)
