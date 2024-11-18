"use client"
import { SignIn } from '@/components/SignIn'
import React from 'react'

const page = () => {
    return (
        <main className='flex justify-center items-center h-screen w-full bg-gradient-to-r from-[#081526] to-[#1D4D8C] via-[#0E2441] '>
            <SignIn />
        </main>
    )
}

export default page
