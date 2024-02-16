module TestResultsHelper
  
  def test_name_options
    ['小テスト', '単元テスト', '中間テスト', '期末テスト']
  end

  def test_type_options
    ['国語', '数学', '理科', '社会', '英語']
  end

  def preparation_hours_options
    (0..24).map { |hour| [hour.to_s, hour] }
  end

  def preparation_minutes_options
    (0..59).map { |minute| [minute.to_s, minute] }
  end
end
