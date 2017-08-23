<template>
    <v-snackbar
                :timeout="timeout"
                :info="true"
                :right="true"
                v-model="show">
        {{ message }}
        <v-btn dark flat @click="snackbar = false">Close</v-btn>
    </v-snackbar>
</template>

<script>
    module.exports = {
        props: ['message', 'snackbar'],
        data: function() {
            return {
                timeout: 3000,
                x: 'right',
                show: false
            }
        },
        watch: {
            snackbar: function() {
                this.show = this.snackbar
            }
        },
        created: function() {
            console.log('snackbar created')
        }
    }
</script>