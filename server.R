## Load libraries
library(shinydashboard)
library(googlesheets4)
library(DT)

function(input, output, session)
{
	## Refresh Timer
	autoInvalidate <- reactiveTimer(10000)

	## Reactive Data Objects to hold nrows
	punk_o_s <- nrow(read_sheet("https://docs.google.com/spreadsheets/d/1eld-RtjigW1hW12OzWV9Cguc3Kcyd77OqGe3lLuyRT4/edit#gid=0"))
	punk_b_s <- nrow(read_sheet("https://docs.google.com/spreadsheets/d/1b5sGe996vq15jrrKPPajlFNpUDM81mpdmyAh0THn1Cw/edit#gid=0"))
	punk_wb_s <- nrow(read_sheet("https://docs.google.com/spreadsheets/d/16aFiahFzQMvKdXnnHTVTDvcknioHmiZqRK8Asr5Kz7c/edit#gid=0"))

	## Reactive Data Objects to hold data
	p_o <- reactive({read_sheet("https://docs.google.com/spreadsheets/d/1eld-RtjigW1hW12OzWV9Cguc3Kcyd77OqGe3lLuyRT4/edit#gid=0")})
	p_b <- reactive({read_sheet("https://docs.google.com/spreadsheets/d/1b5sGe996vq15jrrKPPajlFNpUDM81mpdmyAh0THn1Cw/edit#gid=0")})
	p_wb <- reactive({read_sheet("https://docs.google.com/spreadsheets/d/16aFiahFzQMvKdXnnHTVTDvcknioHmiZqRK8Asr5Kz7c/edit#gid=0")})

	## Reactive code to auto update tables
	observe({
				autoInvalidate()
				p_ot <- read_sheet("https://docs.google.com/spreadsheets/d/1eld-RtjigW1hW12OzWV9Cguc3Kcyd77OqGe3lLuyRT4/edit#gid=0")
				if(nrow(p_ot)>punk_o_s) p_o() <- p_ot
			})
	observe({
				autoInvalidate()
				p_bt <- read_sheet("https://docs.google.com/spreadsheets/d/1b5sGe996vq15jrrKPPajlFNpUDM81mpdmyAh0THn1Cw/edit#gid=0")
				if(nrow(p_bt)>punk_b_s) p_b() <- p_bt
			})
	observe({
				autoInvalidate()
				p_wbt <- read_sheet("https://docs.google.com/spreadsheets/d/16aFiahFzQMvKdXnnHTVTDvcknioHmiZqRK8Asr5Kz7c/edit#gid=0")
				if(nrow(p_wbt)>punk_wb_s) p_wb() <- p_wbt
			})

	## Plots
	output$offer_table <- renderDataTable({
												o_tab <- p_o()
												o_tab <- o_tab[order(o_tab$block.timestamp,decreasing=TRUE),]
												out_tab <- data.frame(
																		Preview = paste0('<img src="',paste0("https://www.larvalabs.com/public/images/cryptopunks/punk",o_tab$punkIndex,".png"),'" height="72"></img>'),
																		"Timestamp" = o_tab$block.timestamp,
																		"Block Number" = o_tab$block.number,
																		"Punk Index" = o_tab$punkIndex,
																		"Value" = o_tab$minValue,
																		check.names=FALSE
																	)
												datatable(
															out_tab,
															escape=FALSE,selection = 'none',
															rownames=FALSE,
															options = list(pageLength = 5,bInfo = FALSE,searching=FALSE)
														) %>% formatDate(2, method = 'toLocaleString')
										},server=FALSE)
	output$bids_table <- renderDataTable({
												o_tab <- p_b()
												o_tab <- o_tab[order(o_tab$block.timestamp,decreasing=TRUE),]
												out_tab <- data.frame(
																		Preview = paste0('<img src="',paste0("https://www.larvalabs.com/public/images/cryptopunks/punk",o_tab$punkIndex,".png"),'" height="72"></img>'),
																		"Timestamp" = o_tab$block.timestamp,
																		"Block Number" = o_tab$block.number,
																		"Punk Index" = o_tab$punkIndex,
																		"Value" = o_tab$value,
																		check.names=FALSE
																	)
												datatable(
															out_tab,
															escape=FALSE,selection = 'none',
															rownames=FALSE,
															options = list(pageLength = 5,bInfo = FALSE,searching=FALSE)
														)%>%formatDate(2, method = 'toLocaleString')
										})
	output$wbids_table <- renderDataTable({
												o_tab <- p_wb()
												o_tab <- o_tab[order(o_tab$block.timestamp,decreasing=TRUE),]
												out_tab <- data.frame(
																		Preview = paste0('<img src="',paste0("https://www.larvalabs.com/public/images/cryptopunks/punk",o_tab$punkIndex,".png"),'" height="72"></img>'),
																		"Timestamp" = o_tab$block.timestamp,
																		"Block Number" = o_tab$block.number,
																		"Punk Index" = o_tab$punkIndex,
																		"Value" = o_tab$value,
																		check.names=FALSE
																	)
												datatable(
															out_tab,
															escape=FALSE,selection = 'none',
															rownames=FALSE,
															options = list(pageLength = 5,bInfo = FALSE,searching=FALSE)
														)%>%formatDate(2, method = 'toLocaleString')
										})
}