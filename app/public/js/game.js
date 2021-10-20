const Game = {
    data() {
      return {

        "game":[]
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
        }
    },
    created() {
        this.fetchGameData();
    } 
} 
  
Vue.createApp(Game).mount('#Game');