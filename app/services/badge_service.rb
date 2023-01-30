class BadgeService

# знает какие тесты прошёл пользователь ранее (кол-во, сложность, категории и прочее) из БД
# знает какой тест прошёл сейчас
# знает какие бейджи существуют (правила)
# определяет на основе п. выше какой бэйдж назначить сейчас, если требуется.

# 1. Выдать бэйдж после успешного прохождения всех тестов из определённой категории (категории Backend)
# 2. Выдать бэйдж после успешного прохождения теста с первой попытки
# 3. Выдать бэйдж после успешного прохождения всех тестов определённого уровня
# 4. Выдать бэйдж после успешного прохождения всех тестов

  CONDITIONS = {
    first_test:            Badges::FirstTest,
    all_tests_in_category: Badges::AllTestsInCategory,
    all_tests_with_level:  Badges::AllTestsWithLevel
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.find_each do |badge|
      condition = CONDITIONS[badge.condition.to_sym].new(@test_passage, badge.condition_parameter)
      add_badge!(badge) if condition.satisfied?
    end
  end

  private

  def add_badge!(badge)
    @user.badges << badge
  end
end
