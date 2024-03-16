module ApplicationHelper
  def grade_and_class_options
    grades = ['1年', '2年', '3年']
    classes_1_to_10 = (1..10).to_a.map { |n| "#{n}組" }
    classes_a_to_j = ('A'..'J').map { |char| "#{char}組" }
                        
    options = grades.product(classes_1_to_10).map { |grade, klass| ["#{grade.strip} #{klass.strip}", "#{grade.strip} #{klass.strip}"] }
    options += grades.product(classes_a_to_j).map { |grade, klass| ["#{grade.strip} #{klass.strip}", "#{grade.strip} #{klass.strip}"] }
    
    options
  end

  def page_title(page_title = '', admin = false)
    base_title = if admin
                  'Test Score Rivals(管理画面)'
                else
                  'Test Score Rivals'
                end

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def active_if(path)
    path == controller_path ? 'active' : ''
  end
end
