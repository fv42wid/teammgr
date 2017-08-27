<template>
    <v-snackbar :info="true"
                :right="true"
                v-model="show"
                :timeout="timeout">
        {{ message }}
        <v-btn dark flat @click="show = false">Close</v-btn>
    </v-snackbar>
</template>

<script>
    module.exports = {
        props: ['message', 'snackbar'],
        data: function() {
            return {
                timeout: 6000,
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
        },
        mounted: function() {
            this.show = true
        }
    }
</script>