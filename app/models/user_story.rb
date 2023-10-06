class UserStory < ApplicationRecord
  belongs_to :epic
  has_many :tasks

  validates :name, presence: true,
             uniqueness: { scope: :epic_id, case_sensitive: false }
  validates :priority, presence: true, uniqueness: { scope: :epic_id }, allow_blank: true

  # Tutaj wchodzi kwestia przypisania, chciałbym żeby była liczona ilość
  # user storiesów w zależności od przynależności do projektu, a nie że
  # zlicza zakres w zależności od ogólnej ilości recordów danego modelu
  # i tu wchodzi większa rozkmina, w której chyba trzeba będzie trochę
  # zmienić rodzaj przypisania
  def self.priority_range
    # Pobierz ilość rekordów w bazie danych
    record_count = count
    # Utwórz zakres od 1 do ilości rekordów
    (1..record_count).to_a
  end
end
