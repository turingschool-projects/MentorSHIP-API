class Seed

  def start
    create_timezones
    create_student
    create_mentors
  end

  def create_timezones
    ['Pacific', 'Mountain', 'Central', 'Eastern'].each do |location|
      MentorTimezone.create!(name: location)
      puts "Created time zone: #{location}!"
    end
  end

  def create_student
    100.times do |n|
      student = Student.create!(
      avatar: 'http://www.forumla.de/attachments/kreative-ecke/151339d1395599937-avatar-wettbewerb-abstimmung-tumblr_mwe88mlxe41sare1go1_1280.png',
      name: Faker::Name.name,
      email: "student#{n}@example.com",
      phone_number: Faker::PhoneNumber.phone_number,
      slack_username: "@student#{n}",
      bio: "This is my student bio",
      last_active: DateTime.now,
      profile_completed: true
      )
      puts "Crated student: #{student.name}!"
    end
  end

  def create_mentors
    50.times do |n|
      times = [1,2,3,4]
      mentor = Mentor.create!(
        avatar: 'http://feverclan.com/forums/customavatars/avatar56958_1.gif',
        name: Faker::Name.name,
        email: "mentor#{n}@notTuring.io",
        phone_number: Faker::PhoneNumber.phone_number,
        slack_username: "@mentor#{n}",
        location: "Denver",
        mentor_timezone_id: times.sample,
        bio: 'This is my mentor bio.',
        expertise: "All things Rails.",
        company: "That one company",
        position: "The most senior jounior dev.",
        last_active: DateTime.now
      )
      puts "Created mentor: #{mentor.name}!"
    end
  end

end


Seed.new.start
