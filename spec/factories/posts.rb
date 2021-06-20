FactoryBot.define do
  factory :post do
    date { 2.days.ago}
    rationale {"Demo rationale now"}
    user
  end

  factory :second_post, class: "Post" do
    date {3.days.ago}
    rationale {"Demo rationale yesterday"}
    user
  end
end