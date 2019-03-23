var searchClient = algoliasearch(
  'U3CYRY5OB9',
  '698d675cb7d68bd70fef1ea5dde80e2b' // search only API key, no ADMIN key
);

var search = instantsearch({
  indexName: 'Answer',
  searchClient: searchClient,
  routing: true,
});

search.addWidget(
  instantsearch.widgets.configure({
    hitsPerPage: 10,
  })
);

search.addWidget(
  instantsearch.widgets.searchBox({
    container: '#search-box',
    placeholder: 'Chercher parmi les réponses',
    autofocus: true
  })
);

// search.addWidget(
//   instantsearch.widgets.refinementList({
//     container: '#search-box',
//     placeholder: 'Chercher parmi les réponses',
//     autofocus: true
//   })
// );

search.addWidget(
  instantsearch.widgets.hits({
    container: '#hits',
    templates: {
      item: document.getElementById('hit-template').innerHTML,
      empty: `<div class="empty">Aucun résultat...</div>`,
    },
  })
);

search.start();
