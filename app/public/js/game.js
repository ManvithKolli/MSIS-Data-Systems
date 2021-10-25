const Game = {
    data() {
      return {

        "game":[],
        gameForm: {},
        selectedGame: null
      }
    },
    computed: {
        
    },
    methods: {
        fetchGameData() {
            fetch('/api/game/')
            .then( response => response.json() )
            .then( (responseJson) => {
                console.log(responseJson);
                this.game = responseJson;
            })
            .catch( (err) => {
                console.error(err);
            })
        },
        postGame(evt) {
            console.log ("Test:", this.selectedGame);
          if (this.selectedGame) {
              this.postEditGame(evt);
          } else {
              this.postNewGame(evt);
          }
        },
        postEditGame(evt) {
          this.gameForm.game_number = this.selectedGame.game_number;
          this.gameForm.game_number = this.selectedGame.game_number;        
          
          console.log("Editing!", this.gameForm);
          fetch('api/game/update.php', {
              method:'POST',
              body: JSON.stringify(this.gameForm),
              headers: {
                "Content-Type": "application/json; charset=utf-8"
              }
            })
            .then( response => response.json() )
            .then( json => {
              console.log("Returned from post:", json);
              // TODO: test a result was returned!
              this.game = json;
              
              // reset the form
              this.handleResetEdit();
            });
        },
        postNewGame(evt) {
          fetch('api/game/create.php', {
              method:'POST',
              body: JSON.stringify(this.gameForm),
              headers: {
                "Content-Type": "application/json; charset=utf-8"
              }
            })
            .then( response => response.json() )
            .then( json => {
              console.log("Returned from post:", json);
              // TODO: test a result was returned!
              this.offers = json;
              
              // reset the form
              this.handleResetEdit();
            });
        },
        postDeleteGame(g) {  
          if ( !confirm("Are you sure you want to delete the game from " + g.game_number + "?") ) {
              return;
          }  
          
          console.log("Delete!", g);
  
          fetch('api/game/delete.php', {
              method:'POST',
              body: JSON.stringify(g),
              headers: {
                "Content-Type": "application/json; charset=utf-8"
              }
            })
            .then( response => response.json() )
            .then( json => {
              console.log("Returned from post:", json);
              // TODO: test a result was returned!
              this.game = json;
              
              // reset the form
              this.handleResetEdit();
            });
        },
        handleEditGame(game) {
            this.selectedGame = game;
            this.gameForm = Object.assign({}, this.selectedGame);
        },
        handleResetEdit() {
            this.selectedGame = null;
            this.gameForm = {};
        }
    },
    created() {
        this.fetchGameData();
    } 
} 
  
Vue.createApp(Game).mount('#Game');