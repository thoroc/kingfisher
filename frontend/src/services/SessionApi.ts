import axios, { AxiosResponse } from 'axios';
import { Session } from '../models/Session';

export const getSession = async (sessionId: string) => {
  const options = {
    headers: {
      'Content-Type': 'application/json',
    },
    method: 'GET',
    url: `${window.wing.env.API_URL}/sessions/${sessionId}`,
  };

  return await axios
    .request(options)
    .then((response: AxiosResponse): Session => {
      console.log('Session:', response.data);
      return response.data;
    })
    .catch((error) => {
      console.error('General error:', error.message);
    });
};

export const createSession = async () => {
  const options = {
    headers: {
      'Content-Type': 'application/json',
    },
    method: 'POST',
    url: `${window.wing.env.API_URL}/sessions/new`,
  };

  return await axios
    .request(options)
    .then((response: AxiosResponse): Session => {
      console.log('Session:', response.data);
      return response.data;
    })
    .catch((error) => {
      console.error('General error:', error.message);
    });
};

export const updateSession = async (sessionId: string, session: Session) => {
  const options = {
    data: session,
    headers: {
      'Content-Type': 'application/json',
    },
    method: 'PUT',
    url: `${window.wing.env.API_URL}/sessions/${sessionId}`,
  };

  return await axios
    .request(options)
    .then((response: AxiosResponse): Session => {
      console.log('Session:', response.data);
      return response.data;
    })
    .catch((error) => {
      console.error('General error:', error.message);
    });
};

export const closeSession = async (sessionId: string) => {
  const options = {
    headers: {
      'Content-Type': 'application/json',
    },
    method: 'POST',
    url: `${window.wing.env.API_URL}/sessions/${sessionId}/close`,
  };

  return await axios
    .request(options)
    .then((response: AxiosResponse): Session => {
      console.log('Session:', response.data);
      return response.data;
    })
    .catch((error) => {
      console.error('General error:', error.message);
    });
};
