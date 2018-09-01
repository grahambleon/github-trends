require "rails_helper"


RSpec.describe Api::V1::ReposController, type: :controller do
  Repo.create([
    {title: "sikaozhe1997 / Xin-Yue", description: "岳昕：致北大师生与北大外国语学院的一封公开信", language: "HTML"}
  ])
  Contributor.create([
    {name: "sikaozhe1997"},
    {name: "zhaobenx"},
    {name: "vzxxbacq"}
  ])
  Contribution.create([
    {contributor_id: 1, repo_id: 1},
    {contributor_id: 2, repo_id: 1},
    {contributor_id: 3, repo_id: 1}
  ])

  describe "GET#index" do
    it "should return a list of all repos" do

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 1
      expect(returned_json.first[1][0]["title"]).to eq("sikaozhe1997 / Xin-Yue")
    end
  end
end
