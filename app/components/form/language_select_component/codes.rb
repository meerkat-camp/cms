module Form
  class LanguageSelectComponent
    class Codes
      ISO_CODES = %w[
        ab aa af ak sq am ar an hy as av ae ay az bm ba eu be bn bh bi bs br bg my ca ch ce ny zh cv kw co cr hr cs da
        dv nl dz en eo et ee fo fj fi fr ff gl gd gv ka de el kl gn gu ht ha he hz hi ho hu is io ig in ia ie iu ik ga
        it ja jv kl kn kr ks kk km ki rw rn ky kv kg ko ku kj lo la lv li ln lt lu lg lb gv mk mg ms ml mt mi mr mh mo
        mn na nv ng nd ne no nb nn ii oc oj cu or om os pi ps fa pl pt pa qu rm ro ru se sm sg sa sr sh st tn sn ii sd
        si ss sk sl so nr es su sw ss sv tl ty tg ta tt te th bo ti to ts tr tk tw ug uk ur uz ve vi vo wa cy wo fy xh
        ji yo za zu
      ].freeze

      def self.all_translated
        perfered_languages = %w[en de]

        # Prefered are deliberately twice in the list to make
        # sure they are found when browsing alphabetically.
        languages = perfered_languages + ISO_CODES

        languages.map { |code| [I18n.t("languages.#{code.strip}"), code] }
      end
    end
  end
end
