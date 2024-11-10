<template>
    <Scaffold navbar-theme="light">
        <template v-slot:header>
            <title>{{doc.title}}</title>
        </template>

        <div class="mt-24    p-8">
            <!--            <div>{{ doc.url }}</div>-->
            <div class=" flex h-screen  ">
                <iframe v-if="doc.url" class=" w-full "
                        :src="`https://view.officeapps.live.com/op/view.aspx?src=${doc.url}`"
                        frameborder="0"
                >

                </iframe>
                <div v-else class="text-red-600 font-bold text-lg text-center mx-auto">
                    {{ doc.title }}
                </div>
            </div>
            <iframe v-if="false" class="w-full h-screen"
                    :src="`http://docs.google.com/gview?url=${doc.url}&embedded=true`"

                    frameborder="0"></iframe>
        </div>
    </Scaffold>
</template>

<script>
import Scaffold from "@/Layouts/Scaffold.vue";


export default {
    name: "DocView",
    components: {
        Scaffold,
    },
    data() {
        return {
            doc: this.$page.props.doc,
        }
    }


}
</script>

<style scoped>

</style>
