class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def check_rule
    return unless Badge.exists?

    Badge.all.each do |badge|
      add_badge_to_user(badge) if self.send("#{badge.rule_name}_rule", badge)
    end
  end

  private

  def add_badge_to_user(badge)
    @test_passage.user.badges << badge
    @test_passage.badges << badge
  end

  def first_passing_rule(options={})
    (UsersPassedTest.
        where(user_id: @test_passage.user_id).
        where(current_question_id: nil).
        where(test_id: @test_passage.test_id).count == 1)
  end

  def all_levels_rule(badge)
    tests_ids= Test.test_by_level(@test_passage.test.level).pluck(:id)
    return passed_tests_count(tests_ids, badge)
  end

  def all_categories_rule(badge)
    tests_ids= Test.test_by_category(@test_passage.test.category.title).pluck(:id)
    passed_tests_count(tests_ids, badge)
  end

  def passed_tests_count(tests_ids, badge)
    tests_count = tests_ids.count
    tests_count_confirm = 0

    tests_ids.each do|id|
      tests_count_confirm += 1  if (UsersPassedTest.
                                      where(test_id: id).
                                      where(user_id: @test_passage.user_id).
                                      where(current_question_id: nil).count >= 1)
    end

    return true if tests_count == tests_count_confirm && badge_been_gotten?(badge, tests_ids)
  end

  def badge_been_gotten?(badge, test_ids)
    !badge.users_passed_tests.where(test_id: test_ids).any?
  end
end