class Search < ApplicationRecord
    belongs_to :user

    scope :search, -> (search_params) do      #scopeでsearchメソッドを定義。(search_params)は引数
        return if search_params.blank?      #検索フォームに値がなければ以下の手順は行わない
    
        name_kana_like(search_params[:name_kana])
        .check_in_from(search_params[:check_in_from])
        .check_in_to(search_params[:check_in_to])
        .phone_like(search_params[:phone])   #下記で定義しているscopeメソッドの呼び出し。「.」で繋げている
    end
    
    
    
end
