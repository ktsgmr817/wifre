University.create!(university_name: "大阪大学", domain: "@ecs.osaka-u.ac.jp")

Hobby.create!(hobbyname: "野球")
Hobby.create!(hobbyname: "サッカー")
Hobby.create!(hobbyname: "テニス")
Hobby.create!(hobbyname: "陸上")
Hobby.create!(hobbyname: "バドミントン")
Hobby.create!(hobbyname: "スキー")
Hobby.create!(hobbyname: "スノーボード")
Hobby.create!(hobbyname: "バレーボール")
Hobby.create!(hobbyname: "バスケットボール")
Hobby.create!(hobbyname: "ハンドボール")
Hobby.create!(hobbyname: "水泳")
Hobby.create!(hobbyname: "剣道")
Hobby.create!(hobbyname: "柔道")
Hobby.create!(hobbyname: "弓道")
Hobby.create!(hobbyname: "ラグビー")
Hobby.create!(hobbyname: "アメフト")
Hobby.create!(hobbyname: "ダンス")

Hobby.create!(hobbyname: "語学(英語)")
Hobby.create!(hobbyname: "語学(英語以外)")
Hobby.create!(hobbyname: "英会話")
Hobby.create!(hobbyname: "TOEIC・TOEFL")
Hobby.create!(hobbyname: "プログラミング")
Hobby.create!(hobbyname: "歴史")
Hobby.create!(hobbyname: "科学")
Hobby.create!(hobbyname: "資格")
Hobby.create!(hobbyname: "クイズ")

Hobby.create!(hobbyname: "ライブ・コンサート")
Hobby.create!(hobbyname: "カラオケ")
Hobby.create!(hobbyname: "楽器演奏")
Hobby.create!(hobbyname: "合掌・アカペラ")

Hobby.create!(hobbyname: "カメラ")
Hobby.create!(hobbyname: "ファッション")
Hobby.create!(hobbyname: "映画")
Hobby.create!(hobbyname: "アニメ・漫画")
Hobby.create!(hobbyname: "ドラマ")
Hobby.create!(hobbyname: "読書")
Hobby.create!(hobbyname: "ミュージカル")
Hobby.create!(hobbyname: "Youtube")
Hobby.create!(hobbyname: "国内旅行")
Hobby.create!(hobbyname: "海外旅行")
Hobby.create!(hobbyname: "温泉巡り")
Hobby.create!(hobbyname: "Switch")
Hobby.create!(hobbyname: "PS4")
Hobby.create!(hobbyname: "ボードゲーム")
Hobby.create!(hobbyname: "ビリヤード")
Hobby.create!(hobbyname: "動物園")
Hobby.create!(hobbyname: "水族館")
Hobby.create!(hobbyname: "釣り")
Hobby.create!(hobbyname: "キャンプ")
Hobby.create!(hobbyname: "天体観測")
Hobby.create!(hobbyname: "美術館")
Hobby.create!(hobbyname: "博物館")
Hobby.create!(hobbyname: "山登り")

Hobby.create!(hobbyname: "料理")
Hobby.create!(hobbyname: "お菓子")
Hobby.create!(hobbyname: "散歩")
Hobby.create!(hobbyname: "グルメ・お酒")
Hobby.create!(hobbyname: "ドライブ")
Hobby.create!(hobbyname: "バイク")
Hobby.create!(hobbyname: "筋トレ")
Hobby.create!(hobbyname: "イラスト")

user = User.new(
  email: 'u120837h@ecs.osaka-u.ac.jp', nickname: '大ちゃん', university_id: 1,
  password: 'password', password_confirmation: 'password',
  lastname: '石橋', firstname: '大輝', birth_date: Date.new(2000,1,1),
  sex: 0, grade: 1, faculty: '法学部', department: '法学科', birth_place: '北海道'
)
user.skip_confirmation!
user.save!

user = User.new(
    email: 'u234098h@ecs.osaka-u.ac.jp', nickname: 'みさ', university_id: 1,
    password: 'password', password_confirmation: 'password',
    lastname: 'みさ', firstname: 'みさ', birth_date: Date.new(2000,1,1),
    sex: 1, grade: 1, faculty: '法学部', department: '国際教養学科', birth_place: '北海道'
)
user.skip_confirmation!
user.save!

user = User.new(
    email: 'u123137h@ecs.osaka-u.ac.jp', nickname: '川村', university_id: 1,
    password: 'password', password_confirmation: 'password',
    lastname: '川村', firstname: '浩輔', birth_date: Date.new(2000,1,1),
    sex: 0, grade: 1, faculty: '文学部', department: '日本史学科', birth_place: '大阪府'
)
user.skip_confirmation!
user.save!

user_hobby = UserHobby.create!(user_id: 1, hobby_id: 3)
user_hobby = UserHobby.create!(user_id: 1, hobby_id: 5)
user_hobby = UserHobby.create!(user_id: 1, hobby_id: 8)
user_hobby = UserHobby.create!(user_id: 1, hobby_id: 9)
user_hobby = UserHobby.create!(user_id: 2, hobby_id: 3)
user_hobby = UserHobby.create!(user_id: 2, hobby_id: 5)
user_hobby = UserHobby.create!(user_id: 2, hobby_id: 8)
user_hobby = UserHobby.create!(user_id: 3, hobby_id: 3)
user_hobby = UserHobby.create!(user_id: 3, hobby_id: 4)
user_hobby = UserHobby.create!(user_id: 3, hobby_id: 6)
