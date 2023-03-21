all: main.pdf

main.pdf: main.tex references.bib Fig*.pgf Table*.tex
	latexmk -pdf main.tex

diff: references.bib Fig*.pgf Table*.tex
	git show 5bca42a4a00517fa852fdda9f4d89110cb1ea876:main.tex > first_submission.tex
	latexdiff first_submission.tex main.tex > diff.tex
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
	cp -L trading_zones_material/plots/cites_matrix.eps Fig8.eps
	cp -L trading_zones_material/plots/cites_matrix*.png ./
	
Table*.tex:
	datalad get trading_zones_material/tables
	cp -L trading_zones_material/tables/specific_vocabulary_th_ph.tex Table2.tex
	cp -L trading_zones_material/tables/top_words.tex Table4.tex
	cp -L trading_zones_material/tables/topic_pacs_validation.tex Table5.tex

clean:
	rm -rf rm -f *.bbl *.aux *.blg *.log *.out *.pdf *.tdo *.fls *.fdb_latexmk *.ist *-eps-converted-to.pdf
	rm -rf Fig*.pgf
	rm -rf Table*.tex
	datalad drop trading_zones_material/plots/*.pgf
	datalad drop trading_zones_material/plots/*.eps
	datalad drop trading_zones_material/tables/*.tex
