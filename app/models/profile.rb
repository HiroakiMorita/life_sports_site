class Profile < ApplicationRecord

  belongs_to :user

  enum gender: { '男性': 0, '女性': 1 }
  enum job: { '学生': 0, '会社員': 1, '自営業': 2, 'その他': 3 }
  enum holiday: { '土日祝': 0, '平日': 1, 'シフト': 2, '他': 3 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
end
