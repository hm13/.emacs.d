;; technical_report_improver.el
;;
;; Author:  Hiroki Sakamoto
;; Created: 16 Dec 2012
;; Version: 1.0
;; Description:
;;   This program will replace words that is not so good for Technical English Report.
;;   By typing "M-x replace-string-with-better-one", the program will suggest words
;;   that is will be better. The list of alternatives comes from
;;
;;      Yoshiaki Shinoda   NAN'UN-DO
;;          "TECHNICAL ENGLISH -How to Write Logically and Effectively-".
;;


(setq replace-table
      (list (cons "absolutely essential"            "essential")
	    (cons "absolutely perfect"              "perfect")
	    (cons "accorded"                        "given")
	    (cons "according as to whether or not"  "if")
	    (cons "actual experience"               "experience")
	    (cons "actual fact"                     "fact")
	    (cons "actual investigation"            "investigation")
	    (cons "actual number"                   "number")
	    (cons "adequate enough"                 "enough")
	    (cons "adequate number of"              "enough")
	    (cons "admit of"                        "allow")
	    (cons "advance forward"                 "advance")
	    (cons "afforded"                        "given")
	    (cons "after this has been done"        "then")
	    (cons "all and every"                   "all")
	    (cons "all of the"                      "all the")
	    (cons "all reasonable men think"        "I believe")
	    (cons "alter and change"                "alter")
	    (cons "alternative choices"             "alternatives")
	    (cons "almost perfect"                  "perfect")
	    (cons "almost unique"                   "unique")
;;	    (cons "and...moreover..."               "moreover")
	    (cons "another one"                     "another")
	    (cons "any and all"                     "any")
	    (cons "approach"                        "answer")
	    (cons "approximately three or four"     "three or four")
	    (cons "arrive at a decision"            "decide")
	    (cons "ascend up"                       "ascend")
	    (cons "as already started"              "")
	    (cons "as an extra added figure"        "as an added figure")
	    (cons "as a general rule"               "as a rule")
;;	    (cons "as can be seen from Fig.5"       "Fig.5 shows")
	    (cons "as far as our own experiment is concerned"  "our experiment shows")
	    (cons "as far as present plans are concerned"      "to present plans")
	    
	    (cons "as for these experiments, they are"         "these experiments are")
	    (cons "as is well known"                "I think")
	    (cons "as of now"                       "now")
	    (cons "as mentioned earlier"            "")
;;	    (cons "as shown in Fig.5"               "Fig.5 shows that")
	    (cons "as regards this example"         "this example is")
	    (cons "as you know"                     "")
	    (cons "at an early date"                "soon")
	    (cons "at a later date"                 "later")
	    (cons "at some time later"              "later")
	    (cons "at some future time"             "later")
;;	    (cons "at the present moment"           "now")
	    (cons "at the present moment in time"   "now")
	    (cons "at the present time"             "now")
	    (cons "at the time"                     "when")
	    (cons "at this point in time"           "now")
	    (cons "at this precise moment in time"  "now")
	    (cons "at this writing"                 "now")
	    (cons "at that point in time"           "then")
;;	    (cons "attain the age of"               "become...years old")
	    (cons "attach together"                 "attach")
	    (cons "audible to the ear"              "audible")
	    (cons "author"                          "I")
	    (cons "authorize and direct"            "direct")
	    (cons "authorize and require"           "require")
	    (cons "baseic fundamentals"             "fundamentals")
	    (cons "brief in duration"               "brief")
	    (cons "bring to a conclusion"           "conclude")
	    (cons "brang to a conclusion"           "concluded")
	    (cons "by advance planning"             "by planning")
	    (cons "by means of"                     "by")
	    (cons "by the same token"               "similarly")
	    (cons "carry out experiment"            "experiment")
	    (cons "cease and come to an end"        "cease")
	    (cons "cease and desist"                "cease")
	    (cons "certain amount of"               "some")
	    (cons "check on"                        "check")
	    (cons "collaborate together"            "collaborate")
	    (cons "combine together"                "collaborate")
	    (cons "complete eliminate"              "eliminate")
	    (cons "completely surrounded"           "surrounded")
	    (cons "conclusive proof"                "proof")
	    (cons "conduct investigation into"      "investigate")
	    
	    (cons "connect together"                "connect")
	    (cons "consensus of opinion"            "consensus")
	    (cons "considerable amount of"          "much")
	    (cons "considerable number of"          "many")
	    (cons "considerable proportion of"      "most")
	    (cons "contemporaneous in age"          "contemporaneous")
	    (cons "continue to remain"              "remain")
	    (cons "cooperate together"              "cooperate")
	    (cons "count up"                        "count")
	    (cons "couple together"                 "couple")
	    (cons "create the possibility"          "make possible")
	    (cons "data"                            "facts")
	    (cons "decrease number of"              "fewer")
	    (cons "decrease relative to"            "less than")
	    (cons "deliberately chosen"             "chosen")
	    (cons "desire and require"              "wish")
	    (cons "descend down"                    "descend")
	    (cons "disappear from sight"            "disapper")
;;	    (cons "distance of five meters"         "five meters")
	    (cons "due to the fact that"            "due to")
;;	    (cons "during the month of May"         "in May")
	    (cons "during the time that"            "while")
	    (cons "each and all"                    "each")
	    (cons "each and every"                  "each")
	    (cons "equally as good as"              "equally good")
	    (cons "equally as well"                 "equally well")
	    (cons "essential condidion"             "essential")
	    (cons "every individual one"            "every one")
	    (cons "fairly"                          "")
	    (cons "false illusion"                  "illusion")
	    (cons "few in number"                   "few")
	    (cons "field of"                        "")
	    (cons "final and conclusion"            "final")
	    (cons "final outcome"                   "outcome")
	    (cons "final result"                    "result")
	    (cons "finish and complete"             "finish")
	    (cons "first and foremost"              "first")
	    (cons "for and during the period of"    "for")
	    (cons "for and in behalf of"            "for")
	    (cons "for a further period of ten years"        "for another ten years")
	    (cons "for obvious reasons"             "I have no evidence")
	    
	    (cons "for the purpose of"              "for")
	    (cons "for the reason that"             "becasue")
	    (cons "free gift"                       "gift")
	    (cons "from the experimental point of view"      "in experiment")
	    (cons "from the standpoint of veiw"     "according to")
	    (cons "full and complete"               "full")
	    (cons "function to transmit"            "transmit")
	    (cons "furnish and supply"              "furnish")
	    (cons "fuse together"                   "fuse")
	    (cons "future prospects"                "prospects")
	    (cons "give positive encouragement to"  "encourage")
	    (cons "group together"                  "group")
	    (cons "great deal of"                   "much")
	    (cons "go under the name of"            "be called")
	    (cons "greater"                         "more")
	    (cons "greater length of time"          "longer")
	    (cons "hard and fast"                   "strict")
	    (cons "have an ability to"              "can")
	    (cons "have and obtain"                 "have")
	    (cons "in the neighborhood of"          "about")
	    (cons "in process of making"            "in regard to")
	    (cons "in regard to"                    "on")
	    (cons "in size"                         "")
	    (cons "in spite of the fact that"       "although")
	    (cons "in the view of the fact that"    "becasue")
	    (cons "in this day and age"             "now")
	    (cons "in shape"                        "")
	    (cons "in the vicinity of"              "near")
	    (cons "inasmuch as"                     "since")
	    (cons "initial beginning"               "initial")
	    (cons "inside of"                       "inside")
	    (cons "here in this section"            "here")
	    (cons "higher number of"                "more")
	    (cons "if and when"                     "if")
	    (cons "if at all possible"              "if possible")
	    (cons "if it is assumed that"           "if")
	    (cons "in accordance with"              "essentials")
	    (cons "in addition"                     "in addition")
	    (cons "it also"                         "it")
	    (cons "in all cases"                    "always")
	    
	    (cons "in all other cases"              "otherwise")
	    (cons "in appearance"                   "")
	    (cons "in between"                      "between")
	    (cons "in color"                        "")
	    (cons "in conjuction with"              "with")
	    (cons "in connection with"              "about")
	    (cons "in considerable number of cases" "often")
	    (cons "in due course"                   "soon")
	    (cons "in equal halves"                 "in halves")
	    (cons "in the event that"               "if")
	    (cons "in excess of"                    "more than")
	    (cons "in a fashion"                    "")
	    (cons "in a fearful way"                "fearfully")
	    (cons "in few cases"                    "sometimes")
	    (cons "in height"                       "")
	    (cons "in many cases"                   "often")
	    (cons "in the majority of instance"     "most of")
	    (cons "in a manner"                     "")
	    (cons "in most cases"                   "usually")
	    (cons "in my own personal option"       "in my opinion")
	    (cons "in the neighborhood of"          "about")
	    (cons "in number"                       "")
	    (cons "in the present communication"    "here")
	    (cons "in the process"                  "")
	    (cons "in question"                     "")
	    (cons "involve the necessity of"        "necessitate")
	    (cons "it has long been known that"     "")
	    (cons "it is apparent, therefore, that" "hence")
	    (cons "it is desired that we receive"   "we want")
	    (cons "it is evident that"              "I think")
	    (cons "it is generally agreed that"     "some people think")
	    (cons "it is imperative that"           "be sure that")
	    (cons "it is of interest to note that"  "")
	    
	    (cons "it is often the case that"       "often")
	    (cons "it is perhaps true to say that"  "I don't know what to think that")
	    (cons "it is possible that"             "possibly")
	    (cons "it is this that"                 "this")
	    (cons "it may, however, be noted that"  "nevertheless")
	    (cons "it may be said that"             "possibly")
	    (cons "it may well be that"             "perhaps")
	    (cons "it seems to be the present writer"                    "I think")
;;	    (cons "it will be seen upon examination of Table 1 that"     "Table 1 shows that")
	    (cons "it would thus appear that"       "apparently")
	    (cons "keep and perform"                "keep")
	    (cons "kind and nature"                 "kind")
	    (cons "large number of"                 "many")
	    (cons "large proportion of"             "much")
	    (cons "later on"                        "later")
	    (cons "lazy in character"               "lazy")
	    (cons "lesser extent"                   "less")
	    (cons "maintain cost controll"          "controll costs")
	    (cons "make application to"             "apply")
	    (cons "make contact with"               "see")
	    (cons "make a count"                    "count")
	    (cons "make the neccessary adjustment"  "adjust")
	    (cons "make an examination of"          "examine")
	    (cons "make a purchase of"              "most")
;;	    (cons "maximum depth of one meter"      "one meeter deep")
	    (cons "majority of"                     "most")
	    (cons "may possible"                    "may")
	    (cons "mechanisms of a physiological nature"                  "physiological mechanisms")
	    (cons "mentioned or reffered to"        "mentioned")
	    (cons "mobile vehicles"                 "vehicles")
	    (cons "moment in time"                  "time")
;;	    (cons "month of July"                   "July")
	    (cons "modern youth of today"           "modern youth")
	    (cons "necessary requisite"             "requisite")
	    (cons "new styles in this day and age"  "new styles")
	    (cons "not acuturally true"             "untrue")
	    (cons "not infrequently"                "often")
	    (cons "null and void"                   "null")
	    (cons "null and of no effect"           "null")
	    (cons "number of"                       "several")
	    (cons "of a reversible nature"          "reversible")
	    
	    (cons "of large size"                   "large")
	    (cons "of such strength that"           "so strong that")
	    (cons "on account of the fact that"     "as")
	    (cons "on an experimental basis"        "by experiment")
;;	    (cons "on Monday 10th July next"        "on July 10")
;;	    (cons "on page 5-10 inclusive"          "on pages 5-10")
	    (cons "on the basis of"                 "from")
	    (cons "on the part of"                  "by")
	    (cons "on a regular basis"              "regularly")
	    (cons "on the order of"                 "about")
	    (cons "one after another in succession" "one after another")
	    (cons "on a theoretical level"          "in theory")
	    (cons "on two separate occasions"       "twice")
	    (cons "one integral piece"              "one piece")
	    (cons "optimum"                         "best")
	    (cons "or alternatively"                "or")
	    (cons "order and direct"                "order")
	    (cons "outside of"                      "outside")
	    (cons "over and above"                  "over")
	    (cons "over a period of the order of a decade"                "for about ten years")
	    (cons "owing to the fact that"          "because")
	    (cons "past history"                    "history")
	    (cons "perform the measurement"         "measure")
	    (cons "pertaining to"                   "on")
	    (cons "predict the expected population" "predict the population")
	    (cons "positive identification"         "an identification")
	    (cons "prepare a job analysis"          "analyze a job")
	    (cons "prior to"                        "before")
	    (cons "prove conclusively"              "prove")
	    (cons "prove of interest to you"        "interest you")
	    (cons "provide a continuous indication of"                    "continuously indicate")
	    (cons "pursuant to"                     "under")
	    (cons "quite new"                       "new")
	    (cons "quite impossible"                "impossible")
	    (cons "quite obvious"                   "obvious")
	    (cons "range all the way from"          "range from")
	    (cons "rather"                          "")
	    (cons "real problem"                    "problem")
	    (cons "reason is because"               "reason is that")
	    (cons "relatively"                      "")
	    (cons "relieve and discharge"           "relieve")
	    
	    (cons "resultant effect"                    "effect")
	    (cons "return back"                    "return")
	    (cons "retreat back"                    "retreat")
	    (cons "rewrite the sentence in different words"                    "rewrite the sentence")
	    (cons "seeming paradox"                    "paradox")
	    (cons "similar in every detail"                    "the same")
	    (cons "small number of"                    "enough")
	    (cons "sole and exclusive"                    "sole")
	    (cons "sufficient number of"                    "enough")
	    (cons "subsequent to"                    "afte")
	    (cons "symptoms indicative of"                    "symptoms")
	    (cons "take into consideration"                    "consider")
	    (cons "temporary loan"                    "loan")
	    (cons "tentative suggest"                    "suggest")
	    (cons "there can be little doubt that this is"                    "this is probably")
	    (cons "they are both alike"                    "they are alike")
	    (cons "through the use of"                    "by")
	    (cons "throughout the whole of the experiment"                    "throughout the experiment")
	    (cons "today's modern engine"                    "today's engine")
;;	    (cons "total of 20"                    "20")
	    (cons "true fact"                    "fact")
	    (cons "try out"                    "try")
	    (cons "two equal halves"                    "halves")
	    (cons "type and kind"                    "type")
	    (cons "undertake a study of"                    "study")
	    (cons "until such time as"                    "until")
	    (cons "usual custom"                    "custom")
	    (cons "use for experiment purposes"                    "use for experiment")
;;	    (cons "value of 10C"                    "10C")
	    (cons "valid information"                    "information")
	    (cons "very necessary"                    "necessary")
	    (cons "very true"                    "true")
	    (cons "visible to the eye"                    "visible")
	    (cons "wholly new"                    "new")
	    (cons "with the object of"                    "to")
	    (cons "with reference to"                    "about")
	    (cons "with regard to"                    "on")
	    (cons "with the result that"                    "so")
;;	    (cons "year 1981"                    "1981")
	    (cons "young teen-ager"                    "teen-ager")
	    )
      )


(defun replace-string-with-better-one ()
  (interactive)
  (let (i j)
    (setq i 0)
    (while (< i (length replace-table))
      (setq j 0)
      (goto-char (point-min))
      (while (search-forward (setq from (car (nth i replace-table))) nil t)
	(setq to (cdr (nth i replace-table)))
	(setq bufstr (format "Replace \"%s\" with \"%s\"?" from to))
	(if (y-or-n-p bufstr)
	    (replace-match to t t)
	  )
	(setq j (1+ j))
	)
      (setq i (1+ i))
      )
    (message "Replace has finished.")
    )
  )				   ; => replace-string-with-better-one




