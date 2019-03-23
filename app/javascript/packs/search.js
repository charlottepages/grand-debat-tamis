var searchClient = algoliasearch(
  "U3CYRY5OB9",
  "698d675cb7d68bd70fef1ea5dde80e2b" // search only API key, no ADMIN key
);

var search = instantsearch({
  indexName: "Answer",
  searchClient: searchClient,
  routing: true
});

search.addWidget(
  instantsearch.widgets.configure({
    hitsPerPage: 30
  })
);

search.addWidget(
  instantsearch.widgets.searchBox({
    container: "#search-box",
    placeholder: "Chercher parmi les réponses",
    autofocus: true
  })
);

search.addWidget(
  instantsearch.widgets.refinementList({
    container: '#themes',
    attribute: 'question_theme',
    operator: 'or',
  })
);

search.addWidget(
  instantsearch.widgets.refinementList({
    container: '#zipcodes',
    attribute: 'zipcode',
    showMore: true,
    searchable: true,
    searchablePlaceholder: 'Chercher un code postal...',
  })
);

search.addWidget(
  instantsearch.widgets.hits({
    container: "#hits",
    cssClasses: {
      item: "result-item"
    },
    transformItems(items) {
      return items.filter(item => {
        return item.question_text
      }).map(item => ({
        ...item,
        theme: item.question_theme.substring(0,2),
        short_content: item.content.substring(0, 3)
      }));
    },
    templates: {
      item: document.getElementById("hit-template").innerHTML,
      empty: `<div class="empty">Aucun résultat...</div>`
    }
  })
);

search.addWidget(
  instantsearch.widgets.pagination({
    container: "#pagination"
  })
);

search.start();