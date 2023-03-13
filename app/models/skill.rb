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
end
