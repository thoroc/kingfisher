import axios, { AxiosResponse } from 'axios';
import { Session, User } from '../models/Session';

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

export const listSessions = async () => {
  const options = {
    headers: {
      'Content-Type': 'application/json',
    },
    method: 'GET',
    url: `${window.wing.env.API_URL}/sessions`,
  };

  return await axios
    .request(options)
    .then((response: AxiosResponse): Session[] => {
      console.log('Sessions:', response.data);
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

export const updateSession = async (sessionId: string, user: User) => {
  const options = {
    data: { user: user },
    headers: {
      'Content-Type': 'application/json',
    },
    method: 'PUT',
    url: `${window.wing.env.API_URL}/sessions/${sessionId}`,
  };

  console.log(`Data: ${JSON.stringify(options.data)}`);

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
