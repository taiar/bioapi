class BaseService
  include Singleton

  @@molecules = []
  @@read = false

  def molecules
    if !@@read
      Rubabel.foreach(base_file_path.to_s) { |molecule| @@molecules << molecule }
      @@read = true
    end
    @@molecules
  end

  def readen
    !!@@read
  end

  private

  def base_file_path
    @@base_file_path ||= Rails.root.join('resource/base/base.mol2')
  end
end
