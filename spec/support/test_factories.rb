module TestFactories


end

include TestFactories


describe '#points' do
     it "returns the sum of all down and up votes" do
         expect( @post.points ).to eq(1) # 3 - 2
      end
     end
   end
 end

    describe '#create_vote' do
     it "generates an up-vote when explicitly called" do
       post = associated_post
       expect( post.up_votes ).to eq(0)
       post.create_vote
       expect( post.up_votes ).to eq(1)
     end
   end
end