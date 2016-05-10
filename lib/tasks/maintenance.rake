namespace :delete do
  desc 'Delete old posts'
  task :old_posts => :environment do
    Post.where('updated_at <= ?', Time.now).each do |p|
      p.destroy
    end
  end
end
