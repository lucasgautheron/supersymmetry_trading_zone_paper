all: main.pdf

main.pdf: main.tex references.bib Fig*.pgf Table*.tex
	latexmk -pdf main.tex

diff: references.bib Fig*.pgf Table*.tex
	git show bc428ac0a85df764f946694cd0f9d3dfa91fa77f:main.tex > second_submission.tex
	latexdiff second_submission.tex main.tex > diff.tex
	latexmk -pdf diff.tex

Fig*.pgf:
	datalad get trading_zones_material/plots
	cp -L trading_zones_material/plots/social_divide_ternary.eps Fig2.eps
	cp -L trading_zones_material/plots/susy_usages.eps Fig3.eps
	cp -L trading_zones_material/plots/susy_correlations.eps Fig4.eps
	cp -L trading_zones_material/plots/susy_correlations*.png ./
	cp -L trading_zones_material/plots/hot_cold_topics_hep_2011_2019_susy.eps Fig5.eps
	cp -L trading_zones_material/plots/trading_zone_0_1.eps Fig6.eps
	cp -L trading_zones_material/plots/trading_zone_1_0.eps Fig7.eps
	cp -L trading_zones_material/plots/category_prediction_stability.eps Fig8.eps
	cp -L trading_zones_material/plots/topics_tsne.eps Fig9.eps
	cp -L trading_zones_material/plots/cites_matrix.eps Fig10.eps
	cp -L trading_zones_material/plots/cites_matrix*.png ./
	
Table*.tex:
	datalad get trading_zones_material/tables
	cp -L trading_zones_material/tables/specific_vocabulary_th_ph.tex Table2.tex
	cp -L trading_zones_material/tables/specific_vocabulary_exp_ph.tex Table3.tex
	cp -L trading_zones_material/tables/top_words.tex Table4.tex
	cp -L trading_zones_material/tables/topic_pacs_validation.tex Table5.tex

clean:
	rm -rf rm -f *.bbl *.aux *.blg *.log *.out *.pdf *.tdo *.fls *.fdb_latexmk *.ist *-eps-converted-to.pdf *.bcf *.run.xml *.acn *.synctex.gz *.toc
	rm -rf Fig*.eps
	rm -rf Table*.tex
	datalad drop trading_zones_material/plots/*.pgf
	datalad drop trading_zones_material/plots/*.eps
	datalad drop trading_zones_material/tables/*.tex
