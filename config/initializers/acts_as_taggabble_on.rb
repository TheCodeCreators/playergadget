# act_as_taggable_on.rb
ActsAsTaggableOn::Tag.class_eval do
  extend FriendlyId
  friendly_id :name, use: :slugged
end
