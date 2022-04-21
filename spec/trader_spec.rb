require_relative '../lib/trader'

describe "scrap function" do
  it "take coin names" do
    expect(first_part).to contain_exactly("Bitcoin", "Ethereum")
  end
end
