module TestResultsHelper
  
  def test_name_options
    ['小テスト 国語', '小テスト 数学', '小テスト 理科', '小テスト 社会', '小テスト 英語',
      '単元テスト 国語', '単元テスト 数学', '単元テスト 理科', '単元テスト 社会', '単元テスト 英語',
      '中間テスト 国語', '中間テスト 数学', '中間テスト 理科', '中間テスト 社会', '中間テスト 英語',
      '期末テスト 国語', '期末テスト 数学', '期末テスト 理科', '期末テスト 社会', '期末テスト 英語']
  end

  def preparation_hours_options
    (0..24).map { |hour| [hour.to_s, hour] }
  end

  def preparation_minutes_options
    (0..59).map { |minute| [minute.to_s, minute] }
  end
end
