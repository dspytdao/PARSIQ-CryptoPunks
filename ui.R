## Load libraries
library(shinydashboard)
library(googlesheets4)

dashboardPage(
	dashboardHeader(title = "PARSIQ NFT Punks"),

    dashboardSidebar(
		sidebarMenu(
			id = "tabs",
			menuItem("New Offers", tabName = "offs", icon = icon("cart-plus")),
			menuItem("New Bids", tabName = "n_bids", icon = icon("user-plus")),
			menuItem("Withdrawn Bids ", tabName = "w_bids", icon = icon("user-minus"))
		)
	),

	dashboardBody(
		tabItems(
			tabItem(tabName = "offs",
				column(width = 12,
					dataTableOutput('offer_table')
				)
			),
			tabItem(tabName = "n_bids",
				column(width = 12,
					dataTableOutput('bids_table')
				)
			),
			tabItem(tabName = "w_bids",
				column(width = 12,
					dataTableOutput('wbids_table')
				)
			)
		)
	)
)