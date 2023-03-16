class Skill < ApplicationRecord
  belongs_to :user
  LANGUAGES = ["JavaScript",
    "Ruby",
    "Python",
    "Java",
    "PHP",
    "C#",
    "C++",
    "TypeScript",
    "C",
    "Swift",
    "R",
    "Objective-C",
    "Scala",
    "Shell",
    "Go",
    "PowerShell",
    "Kotlin",
    "Rust",
    "Dart",
    "CSS"]
    validates :language, uniqueness: {scope: :user}
    validate :less_than_three

  def less_than_three
    if Skill.where(user: user).count >= 3
      errors.add(:language, "Maximo tres linguagens")
    end
  end
end
