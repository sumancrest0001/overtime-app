FactoryBot.define do
  factory :post do
    date { 2.days.ago}
    rationale {"Demo rationale now"}
    overtime_request {4.5}
    user
  end

  factory :second_post, class: "Post" do
    date {3.days.ago}
    rationale {"Demo rationale yesterday"}
    overtime_request {0.25}
    user
  end

end