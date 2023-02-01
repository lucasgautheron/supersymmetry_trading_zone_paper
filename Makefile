all: main.pdf

main.pdf: Fig*.pgf Table*.tex
	latexmk -pdf main.tex

Fig*.pgf:
	datalad get trading_zones_material/plots
	cp -L trading_zones_material/plots/social_divide_ternary.pgf Fig2.pgf
	cp -L trading_zones_material/plots/susy_usages.pgf Fig3.pgf
	cp -L trading_zones_material/plots/susy_correlations.pgf Fig4.pgf
	cp -L trading_zones_material/plots/susy_correlations*.png ./
	cp -L trading_zones_material/plots/hot_cold_topics_hep_2011_2019_susy.pgf Fig5.pgf
	cp -L trading_zones_material/plots/trading_zone_0_1.pgf Fig6.pgf
	cp -L trading_zones_material/plots/trading_zone_1_0.pgf Fig7.pgf
	cp -L trading_zones_material/plots/trades.pgf Fig8.pgf
	cp -L trading_zones_material/plots/cites_matrix.pgf Fig9.pgf
	cp -L trading_zones_material/plots/cites_matrix*.png ./

Table*.tex:
	datalad get trading_zones_material/tables
	cp -L trading_zones_material/tables/specific_vocabulary_th_ph.tex Table2.tex
	cp -L trading_zones_material/tables/top_words.tex Table4.tex
	cp -L trading_zones_material/tables/topic_pacs_validation.tex Table5.tex

clean:
	rm -rf rm -f main.bbl main.aux main.blg main.log main.out main.pdf main.tdo main.fls main.fdb_latexmk texput.log *-eps-converted-to.pdf
	rm -rf Fig*.pgf
	rm -rf Table*.tex
	datalad drop trading_zones_material/plots
	datalad drop trading_zones_material/tables