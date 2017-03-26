module MicropostsHelper

    def correct_user?
        current_user == @micropost.user
    end
end
